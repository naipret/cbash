@ECHO off
setlocal EnableDelayedExpansion

:: ---------------! CHANGE THIS ONLY !---------------

SET "where_is_msys64_folder=C:\msys64"

:: write it after "="
:: no space " " on start
:: change " " in some folder name to "^ "
:: no slash "\" at the end
:: --------------------------------------------------

:: where to learn cmd programming: https://en.wikibooks.org/wiki/Windows_Programming/Programming_CMD

:DEFAULT
IF "x%~1" == "x" (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT
) ELSE IF "x%~1" == "x." (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT
) ELSE IF "x%~1" == "x.." (
  CD /d ..
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT
) ELSE IF "x%~1" == "x~" (
  CD /d %userprofile%
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start -ucrt64
  EXIT
)

:OPTION-help
IF "%~1" == "-help" (
  GOTO :F-help
  EXIT
)
IF "%~1" == "--help" (
  GOTO :F-help
  EXIT
)
IF "%~1" == "-h" (
  GOTO :F-help
  EXIT
)
IF "%~1" == "help" (
  GOTO :F-help
  EXIT
)
IF "%~1" == "h" (
  GOTO :F-help
  EXIT
)

:OPTION-update
IF "%~1" == "-update" (
  GOTO :F-update
  EXIT
)
IF "%~1" == "--update" (
  GOTO :F-update
  EXIT
)
IF "%~1" == "-u" (
  GOTO :F-update
  EXIT
)

:OPTION-reset
IF "%~1" == "-reset" (
  GOTO :F-reset
  EXIT
)
IF "%~1" == "--reset" (
  GOTO :F-reset
  EXIT
)
IF "%~1" == "-r" (
  GOTO :F-reset
  EXIT
)

:OPTION-version
IF "%~1" == "-version" (
  GOTO :F-version
  EXIT
)
IF "%~1" == "--version" (
  GOTO :F-version
  EXIT
)
IF "%~1" == "-v" (
  GOTO :F-version
  EXIT
)

:OPTION-msys2
SET "which=-ucrt64"

:OPTION-msys2-msys
IF "%~1" == "-msys2" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-msys" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-m" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys-msys" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys-m" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mm" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-m" (
  SET "which=-msys"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-mingw64
IF "%~1" == "-msys2-mingw64" (
  SET "which=-mingw64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-m64" (
  SET "which=-mingw64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mm64" (
  SET "which=-mingw64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-m64" (
  SET "which=-mingw64"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-mingw32
IF "%~1" == "-msys2-mingw32" (
  SET "which=-mingw32"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-m32" (
  SET "which=-mingw32"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mm32" (
  SET "which=-mingw32"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-m32" (
  SET "which=-mingw32"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-ucrt64
IF "%~1" == "-msys2-ucrt64" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-ucrt" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-u64" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
@REM IF "%~1" == "-msys2-u" (
@REM   SET "which=-ucrt64"
@REM   GOTO :F-msys2-path
@REM   EXIT
@REM )
IF "%~1" == "-mu64" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
@REM IF "%~1" == "-mu" (
@REM   SET "which=-ucrt64"
@REM   GOTO :F-msys2-path
@REM   EXIT
@REM )
IF "%~1" == "-msys2-default" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-d" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-md" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-clang64
IF "%~1" == "-msys2-clang64" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-clang" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-c64" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-c" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mc64" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mc" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-clang32
IF "%~1" == "-msys2-clang32" (
  SET "which=-clang32"
  GOTO :F-msys2-path
  EXIT
)
@REM IF "%~1" == "-msys2-clang" (
@REM   SET "which=-clang64"
@REM   GOTO :F-msys2-path
@REM   EXIT
@REM )
IF "%~1" == "-msys2-c32" (
  SET "which=-clang32"
  GOTO :F-msys2-path
  EXIT
)
@REM IF "%~1" == "-msys2-c" (
@REM   SET "which=-clang64"
@REM   GOTO :F-msys2-path
@REM   EXIT
@REM )
IF "%~1" == "-mc32" (
  SET "which=-clang32"
  GOTO :F-msys2-path
  EXIT
)
@REM IF "%~1" == "-mc" (
@REM   SET "which=-clang64"
@REM   GOTO :F-msys2-path
@REM   EXIT
@REM )

:OPTION-msys2-clangarm64
IF "%~1" == "-msys2-clangarm64" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-carm64" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-carm" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-ca64" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-msys2-ca" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mcarm64" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mcarm" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mcarm" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)
IF "%~1" == "-mca" (
  SET "which=-clangarm64"
  GOTO :F-msys2-path
  EXIT
)

:OPTION-msys2-update
IF "%~1" == "-msys2-update" (
  GOTO :F-msys2-update
  EXIT
)
IF "%~1" == "-msys2-u" (
  GOTO :F-msys2-update
  EXIT
)
IF "%~1" == "-mu" (
  GOTO :F-msys2-update
  EXIT
)

:OPTION-wsl
IF "%~1" == "-wsl" (
  GOTO :F-wsl-path
  EXIT
)
IF "%~1" == "-w" (
  GOTO :F-wsl-path
  EXIT
)

:OPTION-wsl-update
IF "%~1" == "-wsl-update" (
  GOTO :F-wsl-update
  EXIT
)
IF "%~1" == "-wsl-u" (
  GOTO :F-wsl-update
  EXIT
)
IF "%~1" == "-wu" (
  GOTO :F-wsl-update
  EXIT
)

:OPTION-wsl-shutdown
IF "%~1" == "-wsl-shutdown" (
  GOTO :F-wsl-shutdown
  EXIT
)
IF "%~1" == "-wsl-s" (
  GOTO :F-wsl-shutdown
  EXIT
)
IF "%~1" == "-ws" (
  GOTO :F-wsl-shutdown
  EXIT
)

ECHO Unknown option: %~1
ECHO Use 'cbash -help' for help
ECHO.

EXIT

:F-msys2-path
IF "x%~2" == "x" (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  EXIT
) ELSE IF "x%~2" == "x." (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  EXIT
) ELSE IF "x%~2" == "x.." (
  CD /d ..
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  EXIT
) ELSE IF "x%~2" == "x~" (
  CD /d %userprofile%
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  EXIT
) ELSE (
  CD /d ^"%~2^"
  ECHO Please add double quotes ^" ^" for the path if the system cannot find
  ECHO For example: -^> ^"C:\Program Files^"
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  EXIT
)

EXIT

:F-wsl-path
IF "x%~2" == "x" (
  %SystemRoot%\system32\wsl.exe
  EXIT
) ELSE IF "x%~2" == "x." (
  %SystemRoot%\system32\wsl.exe
  EXIT
) ELSE IF "x%~2" == "x.." (
  CD /d ..
  %SystemRoot%\system32\wsl.exe
  EXIT
) ELSE IF "x%~2" == "x~" (
  CD /d %userprofile%
  %SystemRoot%\system32\wsl.exe
  EXIT
) ELSE (
  CD /d %~2
  %SystemRoot%\system32\wsl.exe
  EXIT
)

EXIT

:F-help
ECHO Usage:      cbash [option] [path]
ECHO.
ECHO Default: -^> cbash [-msys2-ucrt64] [C:\current\dir]
ECHO.
ECHO Option:
ECHO     -help ^| --help ^| -h
ECHO     -update ^| --update ^| -u
ECHO     -reset ^| --reset ^| -r
ECHO     -version ^| --version ^| -v
ECHO.
ECHO     -msys2[-msys] ^| -msys2-mingw64 ^| -msys2-ucrt64 ^| -msys2-clang64 ^| -msys2-clangarm64
ECHO     -msys2-update ^| -mu
ECHO.
ECHO     -wsl
ECHO     -wsl-update ^| -wu
ECHO     -wsl-shutdown ^| -ws
ECHO.
ECHO Repository: https://github.com/NaiPret/cbash.git
ECHO.

EXIT

:F-update
SET "where_is_cbash_folder=%~dp0"
ECHO -^> cd %where_is_cbash_folder%
CD /d %where_is_cbash_folder%
ECHO -^> git pull https://github.com/NaiPret/cbash.git
git pull https://github.com/NaiPret/cbash.git
ECHO -^> git reset --hard
git reset --hard
ECHO.

EXIT

:F-reset
SET "where_is_cbash_folder=%~dp0"
ECHO -^> cd %where_is_cbash_folder%
CD /d %where_is_cbash_folder%
ECHO -^> git reset --hard
git reset --hard
ECHO.

EXIT

:F-version
SET "what_version=1.19 ^(14/10/2023^)"
ECHO cbash version %what_version%
ECHO.

EXIT

:F-msys2-update
SET "where_is_cbash_folder=%~dp0"
CD %where_is_cbash_folder%
SET "temp=%__CD__%"
ECHO -^> pacman -Suy
%where_is_msys64_folder%\usr\bin\pacman.exe -Suy
ECHO.

EXIT

:F-wsl-update
ECHO -^> wsl --update
wsl --update
ECHO -^> wsl sudo apt update && sudo apt upgrad
wsl sudo apt update ^&^& sudo apt upgrade

EXIT

:F-wsl-shutdown
ECHO -^> wsl --shutdown
wsl --shutdown

EXIT
