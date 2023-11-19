@ECHO off
@REM setlocal EnableDelayedExpansion

SET "version=3.21 ^(19/11/2023^)"

:: ---------------! CHANGE THIS ONLY !---------------

SET "msys64_location=C:\msys64\"

:: --------------------------------------------------

:DEFAULT
IF "x%~1" == "x" %msys64_location%msys2_shell.cmd -defterm -here -no-start -ucrt64 & EXIT /b 0
IF "x%~1" == "x." %msys64_location%msys2_shell.cmd -defterm -here -no-start -ucrt64 & EXIT /b 0
IF "x%~1" == "x.." (
  CD /d ..
  %msys64_location%msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT /b 0
)
IF "x%~1" == "x~" (
  CD /d %userprofile%
  %msys64_location%msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT /b 0
)

:OPTION-help
IF "%~1" == "-help" GOTO :F-help & EXIT /b 0
IF "%~1" == "--help" GOTO :F-help & EXIT /b 0
IF "%~1" == "-h" GOTO :F-help & EXIT /b 0
IF "%~1" == "help" GOTO :F-help & EXIT /b 0
IF "%~1" == "h" GOTO :F-help & EXIT /b 0

:OPTION-update
IF "%~1" == "-update" GOTO :F-update & EXIT /b 0
IF "%~1" == "--update" GOTO :F-update & EXIT /b 0
IF "%~1" == "-u" GOTO :F-update & EXIT /b 0

:OPTION-reset
IF "%~1" == "-reset" GOTO :F-reset & EXIT /b 0
IF "%~1" == "--reset" GOTO :F-reset & EXIT /b 0
IF "%~1" == "-r" GOTO :F-reset & EXIT /b 0

:OPTION-version
IF "%~1" == "-version" GOTO :F-version
IF "%~1" == "--version" GOTO :F-version
IF "%~1" == "-v" GOTO :F-version

:OPTION-msys2-msys
IF "%~1" == "-msys2-msys" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-m" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmsys" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mm" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-m" SET "which=-msys" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-mingw64
IF "%~1" == "-msys2-mingw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-mingw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-mgw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-mgw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-m64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-m" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmingw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmingw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmgw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmgw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mm64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mm" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mingw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mingw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mgw64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mgw" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-m64" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-m" SET "which=-mingw64" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-mingw32
IF "%~1" == "-msys2-mingw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-mingw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-mgw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-mgw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-m32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-m" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmingw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mmingw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mmgw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mmgw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mm32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mm" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mingw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mingw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mgw32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mgw" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-m32" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-m" SET "which=-mingw32" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-ucrt64
IF "%~1" == "-msys2-ucrt64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-ucrt" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-u64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-u" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mucrt64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mucrt" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mu64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mu" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-ucrt64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-ucrt" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-u64" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-u" SET "which=-ucrt64" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-clang64
IF "%~1" == "-msys2-clang64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-clang" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-c64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-c" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclang64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclang" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mc64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mc" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clang64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clang" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-c64" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-c" SET "which=-clang64" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-clang32
IF "%~1" == "-msys2-clang32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-clang" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-c32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-msys2-c" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclang32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mclang" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mc32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-mc" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clang32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-clang" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-c32" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0
@REM IF "%~1" == "-c" SET "which=-clang32" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-clangarm64
IF "%~1" == "-msys2-clangarm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-clangarm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-clanga64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-clanga" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-carm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-carm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-ca64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-msys2-ca" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclangarm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclangarm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclanga64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mclanga" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mcarm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mcarm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mca64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-mca" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clangarm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clangarm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clanga64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-clanga" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-carm64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-carm" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-ca64" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0
IF "%~1" == "-ca" SET "which=-clangarm64" & GOTO :F-msys2-path & EXIT /b 0

:OPTION-msys2-update
IF "%~1" == "-msys2-update" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-msys2-u" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-mupdate" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-mu" GOTO :F-msys2-update & EXIT /b 0
@REM IF "%~1" == "-update" GOTO :F-msys2-update & EXIT /b 0
@REM IF "%~1" == "-u" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-pacman-update" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-pacman-u" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-pupdate" GOTO :F-msys2-update & EXIT /b 0
IF "%~1" == "-pu" GOTO :F-msys2-update & EXIT /b 0

:OPTION-wsl
IF "%~1" == "-wsl" GOTO :F-wsl-path & EXIT /b 0
IF "%~1" == "-w" GOTO :F-wsl-path & EXIT /b 0

:OPTION-wsl-update
IF "%~1" == "-wsl-update" GOTO :F-wsl-update & EXIT /b 0
IF "%~1" == "-wsl-u" GOTO :F-wsl-update & EXIT /b 0
IF "%~1" == "-wupdate" GOTO :F-wsl-update & EXIT /b 0
IF "%~1" == "-wu" GOTO :F-wsl-update & EXIT /b 0

:OPTION-wsl-shutdown
IF "%~1" == "-wsl-shutdown" GOTO :F-wsl-shutdown & EXIT /b 0
IF "%~1" == "-wsl-s" GOTO :F-wsl-shutdown & EXIT /b 0
IF "%~1" == "-wshutdown" GOTO :F-wsl-shutdown & EXIT /b 0
IF "%~1" == "-ws" GOTO :F-wsl-shutdown & EXIT /b 0

:OPTION-winget-update
IF "%~1" == "-winget-update" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-winget-u" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wg-update" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wg-u" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wingetupdate" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wingetu" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wgupdate" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wgu" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-winget" GOTO :F-winget-update & EXIT /b 0
IF "%~1" == "-wg" GOTO :F-winget-update & EXIT /b 0

ECHO Unknown option: %~1
ECHO Use ^"cbash -help^" for help.
ECHO.

EXIT /b 0

:F-msys2-path
IF "x%~2" == "x" %msys64_location%msys2_shell.cmd -defterm -here -no-start %which% & EXIT /b 0
IF "x%~2" == "x." %msys64_location%msys2_shell.cmd -defterm -here -no-start %which% & EXIT /b 0
IF "x%~2" == "x.." (
  CD /d ..
  %msys64_location%msys2_shell.cmd -defterm -here -no-start %which%
  EXIT /b 0
) 
IF "x%~2" == "x~" (
  CD /d %userprofile%
  %msys64_location%msys2_shell.cmd -defterm -here -no-start %which%
  EXIT /b 0
) ELSE (
  CD /d "%~2"
  IF NOT EXIST "%~2" (
    ECHO Please add double quotes ^" ^" for the path if the system cannot find.
    ECHO For example: -^> cbash %~1 ^"C:\Program Files^".
    ECHO.
    EXIT /b 0
  )
  %msys64_location%msys2_shell.cmd -defterm -here -no-start %which%
  EXIT /b 0
)
EXIT /b 0

:F-wsl-path
IF "x%~2" == "x" wsl & ECHO. & EXIT /b 0
IF "x%~2" == "x.." wsl & ECHO. & EXIT /b 0
IF "x%~2" == "x.." (
  CD /d ..
  wsl
  ECHO.
  EXIT /b 0
) 
IF "x%~2" == "x~" (
  CD /d %userprofile%
  wsl
  ECHO.
  EXIT /b 0
) ELSE (
  CD /d "%~2"
  IF NOT EXIST "%~2" (
    ECHO Please add double quotes ^" ^" for the path if the system cannot find.
    ECHO For example: -^> cbash %~1 ^"C:\Program Files^".
    ECHO.
    EXIT /b 0
  )
  wsl
  ECHO.
  EXIT /b 0
)
EXIT /b 0

:F-help
ECHO Usage:      cbash [option] [path]
ECHO.
ECHO Default: -^> cbash [-msys2-ucrt64] [C:\current\dir]
ECHO.
ECHO Option:
ECHO     -help    ^| --help    ^| -h                          Display help information.
ECHO     -update  ^| --update  ^| -u                          Update and reset this tool.
ECHO     -reset   ^| --reset   ^| -r                          Reset this tool to default.
ECHO     -version ^| --version ^| -v                          Display version information.
ECHO.
ECHO     -msys2[-msys]  ^| -msys2-ucrt64 ^| -msys2-mingw[64]  MSYS2: Choose msys2 shell type.
ECHO     -msys2-clang[64] ^| -msys2-clangarm64               Any short option can be used:
ECHO                                                          "-msys2-mingw32" -^> "-mm32"
ECHO     -msys2-update  ^| -mu ^| -pacman-update ^| -pu        Update msys2 + pacman package.
ECHO.
ECHO     -wsl                                               WSL:
ECHO     -wsl-update    ^| -wu                               Update wsl + apt package.
ECHO     -wsl-shutdown  ^| -ws                               Shutdown wsl machine.
ECHO.
ECHO     -winget-update ^| -wgu                              Update package via winget.
ECHO.
ECHO Repository: https://github.com/NaiPret/cbash.git       Thanks for using cbash.
ECHO.
EXIT /b 0

:F-update
SET "cbash_location=%~dp0"
ECHO -^> cd %cbash_location%
CD /d %cbash_location%
ECHO -^> git pull https://github.com/NaiPret/cbash.git
git pull https://github.com/NaiPret/cbash.git
ECHO -^> git reset --hard
git reset --hard
ECHO.
EXIT /b 0

:F-reset
SET "cbash_location=%~dp0"
ECHO -^> cd %cbash_location%
CD /d %cbash_location%
ECHO -^> git reset --hard
git reset --hard
ECHO.
EXIT /b 0

:F-version
ECHO cbash version %version%
ECHO.
EXIT /b 0

:F-msys2-update
SET "cbash_location=%~dp0"
CD %cbash_location%
ECHO -^> pacman -Suy
pacman -Suy
ECHO.
EXIT /b 0

:F-wsl-update
ECHO -^> wsl --update
wsl --update
ECHO -^> wsl sudo apt update ^&^& sudo apt upgrade
wsl sudo apt update
wsl sudo apt upgrade
EXIT /b 0

:F-wsl-shutdown
ECHO -^> wsl --shutdown
wsl --shutdown
EXIT /b 0

:F-winget-update
ECHO -^> winget update --all --include-unknown
winget update --all --include-unknown
EXIT /b 0
