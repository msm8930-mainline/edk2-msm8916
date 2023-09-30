/** @file
  Support ResetSystem Runtime call using Qualcomm PMIC via SPMI.

  Copyright (c) 2008 - 2009, Apple Inc. All rights reserved.<BR>
  Copyright (c) 2013-2015, ARM Ltd. All rights reserved.<BR>
  Copyright (c) 2014, Linaro Ltd. All rights reserved.<BR>
  Copyright (c) 2018, Bingxing Wang. All rights reserved.<BR>

  This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD
License which accompanies this distribution.  The full text of the license may
be found at http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

#include <PiDxe.h>

#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/DebugLib.h>
#include <Library/EfiResetSystemLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>

#include <Library/IoLib.h>
#include <Library/LKEnvLib.h>
#include <Library/dload_util.h>
// Must come in order
#include <Library/QcomPm8x41Lib.h>

#include <Chipset/reboot.h>
#include <Platform/iomap.h>

EFI_EVENT mPmicShutdownVirtualAddressChangedEvent;

STATIC UINTN pPonPsHoldAddressVirtual;
STATIC UINTN pResetReasonAddressVirtual;

/* bit 7: S2_RESET_EN, bit 0:3 : RESET_TYPE  */
#define PON_PS_HOLD_RESET_CTL 0x85A
#define PON_PS_HOLD_RESET_CTL2 0x85B

/* PON Peripheral register bit values */
#define RESIN_ON_INT_BIT 1
#define KPDPWR_ON_INT_BIT 0
#define RESIN_BARK_INT_BIT 4
#define S2_RESET_EN_BIT 7

#define REG_OFFSET(_addr) ((_addr)&0xFF)
#define PERIPH_ID(_addr) (((_addr)&0xFF00) >> 8)
#define SLAVE_ID(_addr) ((_addr) >> 16)

STATIC VOID shutdown_device(VOID)
{

  DEBUG((EFI_D_ERROR, "Shutdown failed\n"));
  ASSERT(0);
}

STATIC VOID reboot_device(UINTN warm)
{

  DEBUG((EFI_D_ERROR, "Rebooting failed\n"));
}

/**
  Resets the entire platform.

  @param  ResetType             The type of reset to perform.
  @param  ResetStatus           The status code for the reset.
  @param  DataSize              The size, in bytes, of WatchdogData.
  @param  ResetData             For a ResetType of EfiResetCold, EfiResetWarm,
or EfiResetShutdown the data buffer starts with a Null-terminated Unicode
string, optionally followed by additional binary data.

**/
EFI_STATUS
EFIAPI
LibResetSystem(
    IN EFI_RESET_TYPE ResetType, IN EFI_STATUS ResetStatus, IN UINTN DataSize,
    IN CHAR16 *ResetData OPTIONAL)
{
  switch (ResetType) {
  case EfiResetPlatformSpecific:
    // Map the platform specific reset as reboot
  case EfiResetWarm:
    // Issue warm reset
    reboot_device(1);
    break;
  case EfiResetCold:
    // Issue cold reset
    reboot_device(0);
    break;
  case EfiResetShutdown:
    shutdown_device();
    break;
  default:
    ASSERT(FALSE);
    return EFI_UNSUPPORTED;
  }

  // We should never be here
  DEBUG((EFI_D_ERROR, "%a: PMIC Reset failed\n", __FUNCTION__));
  CpuDeadLoop();
  return EFI_DEVICE_ERROR;
}

VOID EFIAPI
     LibRuntimeVirtualAddressChanged(IN EFI_EVENT Event, IN VOID *Context)
{
  gRT->ConvertPointer(0, (VOID **)&pPonPsHoldAddressVirtual);

  gRT->ConvertPointer(0, (VOID **)&pResetReasonAddressVirtual);
}

/**
  Initialize any infrastructure required for LibResetSystem () to function.

  @param  ImageHandle   The firmware allocated handle for the EFI image.
  @param  SystemTable   A pointer to the EFI System Table.

  @retval EFI_SUCCESS   The constructor always returns EFI_SUCCESS.

**/
EFI_STATUS
EFIAPI
LibInitializeResetSystem(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EFI_STATUS Status;

  // Set Address
  pPonPsHoldAddressVirtual   = MPM2_MPM_PS_HOLD;
	
  pResetReasonAddressVirtual = RESTART_REASON_ADDR;

  // Register Virtual Address Change event.
  Status = gBS->CreateEventEx(
      EVT_NOTIFY_SIGNAL, TPL_NOTIFY, LibRuntimeVirtualAddressChanged, NULL,
      &gEfiEventVirtualAddressChangeGuid,
      &mPmicShutdownVirtualAddressChangedEvent);

  // Do not care
  return Status;
}
