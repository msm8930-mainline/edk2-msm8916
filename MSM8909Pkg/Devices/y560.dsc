[Defines]
  PLATFORM_NAME                  = MSM8909Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = MSM8909Pkg/MSM8909Pkg.fdf

!include MSM8909Pkg/MSM8909Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (1GB)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x60000000
  
  # Framebuffer
  gMSM8909PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x8e000000
  gMSM8909PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|720
  gMSM8909PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1280
  gMSM8909PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|720
  gMSM8909PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|1280
