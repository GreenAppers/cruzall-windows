!include x64.nsh
!include "MUI2.nsh"

!define MUI_ICON ".\app.ico"
!define MUI_HEADERIMAG
!define MUI_HEADERIMAGE_BITMAP ".\logo.bmp"
!define MUI_HEADERIMAGE_RIGHT

!insertmacro MUI_LANGUAGE "English"

Function .onInit
	${If} ${RunningX64}
	${else}
	MessageBox MB_OK "Sorry this application runs only on x64 machines"
	Abort
	${EndIf}
FunctionEnd

Name "Cruzall"
OutFile "Cruzall-x64-installer.exe"
InstallDir $PROGRAMFILES64\GreenAppers\Cruzall

Page directory
Page instfiles
Section "";

RmDir /r "$INSTDIR"
SetOutPath "$INSTDIR"
File /a /r ".\cruzall\build\windows\x64\Release\Runner\"
File ".\vc_redist.x64.exe" 

SetOutPath "$INSTDIR"
createShortCut "$SMPROGRAMS\Cruzall.lnk" "$INSTDIR\Cruzall.exe"

ReadRegStr $1 HKLM "SOFTWARE\Microsoft\VisualStudio\10.0\VC\VCRedist\x64" "Installed"
StrCmp $1 1 installed
ExecWait '"$INSTDIR\vc_redist.x64.exe" /passive /norestart'
installed:
Delete "$INSTDIR\vc_redist.x64.exe"

SectionEnd
