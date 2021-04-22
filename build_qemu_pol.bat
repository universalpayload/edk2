call build -p UefiPayloadPkg\UefiPayloadPkg.dsc -a IA32 -a X64 -t VS2019
if not %ERRORLEVEL% == 0 exit /b 1

genfw -o Build\UefiPayloadPkgX64\DEBUG_VS2019\FV\DxeFv.rc --hiipackage Build\UefiPayloadPkgX64\DEBUG_VS2019\FV\DXEFV.Fv -g B77C0460-BD7B-44A1-BBF2-00F8E0F8E169 
rc /FoUefiPayloadPkg\UefiPayloadEntry\DxeFv.lib Build\UefiPayloadPkgX64\DEBUG_VS2019\FV\DxeFv.rc

call build -p uefipayloadpkg\UefiPayloadPkg.dsc -a IA32 -a X64 -t VS2019 -m UefiPayloadPkg\UefiPayloadEntry\UefiPayloadEntry.inf
if not %ERRORLEVEL% == 0 exit /b 1

copy e:\work\edk2\Build\UefiPayloadPkgX64\DEBUG_VS2019\IA32\UefiPayloadPkg\UefiPayloadEntry\UefiPayloadEntry\OUTPUT\PayloadEntry.efi /y

call build -p OvmfPkg\OvmfPkgPol.dsc -a IA32 -a X64 -D DEBUG_ON_SERIAL_PORT -t VS2019
