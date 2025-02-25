#include <Base.h>
#include <Library/LKEnvLib.h>
#include <Library/QcomClockLib.h>
#include <Library/QcomPlatformMmcLib.h>
#include <Library/QcomPlatformMmcClockOverrideLib.h>
#include <Chipset/mmc_sdhci.h>

VOID LibQcomPlatformMmcClockInit(UINT32 interface)
{
  CHAR8 clk_name[64];
  INTN ret;

  snprintf(clk_name, sizeof(clk_name), "sdc%u_iface_clk", interface);

  /* enable interface clock */
  ret = gClock->clk_get_set_enable(clk_name, 0, 1);
  if(ret)
  {
    DEBUG((EFI_D_ERROR, "failed to set sdc%u_iface_clk ret = %d\n", interface, ret));
    ASSERT(0);
  }
}

VOID LibQcomPlatformMmcClockConfig(UINT32 interface, UINT32 freq)
{
  INTN ret = 0;
  CHAR8 clk_name[64];

  freq = LibQcomPlatformMmcTranslateClockRate(freq);

  snprintf(clk_name, sizeof(clk_name), "sdc%u_core_clk", interface);

  ret = gClock->clk_get_set_enable(clk_name, freq, 1);
  if(ret)
  {
    DEBUG((EFI_D_ERROR, "failed to set sdc%u_core_clk @%u ret = %d\n", interface, freq, ret));
    ASSERT(0);
  }
     /* Clear screen at new FB address */ 
  UINT8 *base = (UINT8 *)0x8e000000ull;
  for (UINTN i = 0; i < 0x00800000; i++) {
    base[i] = 0;
  }
}

VOID LibQcomPlatformMmcClockConfigCdc(UINT32 interface)
{

}
