!include x64.nsh
!include "MUI2.nsh"

!define MUI_ICON "app.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_RIGHT

Name "Cruzall"
OutFile "Cruzall-x64-installer.exe"
InstallDir $PROGRAMFILES\GreenAppers\Cruzall

Function .onInit
	${If} ${RunningX64}
	${EnableX64FSRedirection}
	${else}
	MessageBox MB_OK "Sorry this application runs only on x64 machines"
	Abort
	${EndIf}
FunctionEnd

Page directory
Page instfiles
Section "";

RmDir /r "$INSTDIR"
SetOutPath "$INSTDIR"
File /a /r ".\cruzall\build\windows\x64\Release\Runner\"

SetOutPath "$INSTDIR"
createShortCut "$SMPROGRAMS\Cruzall.lnk" "$INSTDIR\Cruzall.exe"

SectionEnd
