@Echo off
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
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start -mingw64
  Exit
)

:OPTION-help
IF "%~1" == "-help" (
  GOTO :F-help
  Exit
)
IF "%~1" == "--help" (
  GOTO :F-help
  Exit
)
IF "%~1" == "-h" (
@Echo off
  GOTO :F-help
  Exit
)

:OPTION-update
IF "%~1" == "-update" (
  GOTO :F-update
  Exit
)
IF "%~1" == "--update" (
  GOTO :F-update
  Exit
)
IF "%~1" == "-u" (
  GOTO :F-update
  Exit
)

:OPTION-version
IF "%~1" == "-version" (
  GOTO :F-version
  Exit
)
IF "%~1" == "--version" (
  GOTO :F-version
  Exit
)
IF "%~1" == "-v" (
  GOTO :F-version
  Exit
)

:OPTION-msys2
SET "which=-mingw64"
IF "%~1" == "-msys" (
  SET "which=-msys"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2" (
  SET "which=-msys"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-msys" (
  SET "which=-msys"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-mingw32" (
  SET "which=-mingw32"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-mingw64" (
  SET "which=-mingw64"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-ucrt64" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-ucrt" (
  SET "which=-ucrt64"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-clang64" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-clang" (
  SET "which=-clang64"
  GOTO :F-msys2-path
  Exit
)
IF "%~1" == "-msys2-update" (
  GOTO :F-msys2-update
  Exit
)
IF "%~1" == "-msys2-u" (
  GOTO :F-msys2-update
  Exit
)

:OPTION-wsl
IF "%~1" == "-wsl" (
  GOTO :F-wsl-path
  Exit
)
IF "%~1" == "-wsl-update" (
  GOTO :F-wsl-update
  Exit
)
IF "%~1" == "-wsl-u" (
  GOTO :F-wsl-update
  Exit
)

@REM :UPDATEALL
@REM IF "%~1" == "-update-all" (
@REM   Echo -^> git pull https://github.com/NaiPret/cbash.git
@REM   git pull https://github.com/NaiPret/cbash.git
@REM   Echo -^> pacman -Suy
@REM   %where_is_msys64_folder%\usr\bin\pacman.exe -Suy
@REM   Echo -^> wsl --update
@REM   wsl --update
@REM   Echo -^> wsl sudo apt update ^&^& sudo apt upgrade
@REM   wsl sudo apt update ^&^& sudo apt upgrade
@REM   Exit
@REM )

Exit

:F-msys2-path
SET "path=%__CD__%"
IF "x%~2" == "x" (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE IF "x%~2" == "x." (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE IF "x%~2" == "x.." (
  cd /d ..
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE (
  cd /d %~2
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which% -where
  Echo.
  Exit
)

Exit

:F-wsl-path
SET "path=%__CD__%"
IF "x%~2" == "x" (
  %SystemRoot%\system32\wsl.exe
  Exit
) ELSE IF "x%~2" == "x." (
  %SystemRoot%\system32\wsl.exe
  Exit
) ELSE IF "x%~2" == "x.." (
  cd /d ..
  %SystemRoot%\system32\wsl.exe
  Exit
) ELSE (
  cd /d %~2
  %SystemRoot%\system32\wsl.exe
  Exit
)

Exit

:F-help
Echo Usage:      cbash [option] [path]
Echo.
Echo Default: -^> cbash [-msys2-mingw64] [C:\current\dir]
Echo.
Echo Option:
Echo     -help ^| --help ^| -h
Echo     -update ^| --update ^| -u
Echo     -version ^| --version ^| -v
Echo.
Echo     -msys2[-msys] ^| -msys2-mingw32 ^| -msys2-mingw64 ^| -msys2-ucrt64 ^| -msys2-clang64
Echo     -msys2-update ^| -msys2-u
Echo.
Echo     -wsl
Echo     -wsl-update ^| -wsl-u
Echo.
Echo Repository: https://github.com/NaiPret/cbash.git
Echo.

Exit

:F-update
SET "where_is_cbash_folder=%~dp0"
CD /d %where_is_cbash_folder%
Echo -^> cd %where_is_cbash_folder%
Echo -^> git pull https://github.com/NaiPret/cbash.git
git pull https://github.com/NaiPret/cbash.git
git reset --hard
Echo.

Exit

:F-version
SET "what_version=1.7 ^(23/09/2023^)"
Echo cbash version %what_version%
Echo.

Exit

:F-msys2-update
SET "where_is_cbash_folder=%~dp0"
cd %where_is_cbash_folder%
SET "temp=%__CD__%"
Echo -^> pacman -Suy
%where_is_msys64_folder%\usr\bin\pacman.exe -Suy
Echo.

Exit

:F-wsl-update
Echo -^> wsl --update
wsl --update
Echo -^> wsl sudo apt update && sudo apt upgrad
wsl sudo apt update ^&^& sudo apt upgrade

Exit
