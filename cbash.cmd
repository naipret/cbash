@Echo off
setlocal EnableDelayedExpansion

:: ---------------- CHANGE THIS ONLY ----------------

SET "where_is_msys64_folder=C:\msys64"
SET "where_is_git_folder=C:\Program^ Files\Git"

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

:OPTION-msys2
IF "%~1" == "-msys2" (
  SET "which=-msys"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-msys" (
  SET "which=-msys"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-msys2" (
  SET "which=-msys"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-mingw32" (
  SET "which=-mingw32"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-mingw64" (
  SET "which=-mingw64"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-mingw" (
  SET "which=-mingw64"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-ucrt64" (
  SET "which=-ucrt64"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-ucrt" (
  SET "which=-ucrt64"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-clang64" (
  SET "which=-clang64"
  GOTO :F-path
  Exit
)
IF "%~1" == "-msys2-clang" (
  SET "which=-clang64"
  GOTO :F-path
  Exit
)

:OPTION-git
IF "%~1" == "-git" (
  %where_is_git_folder%\bin\bash.exe  -i -l
  Exit
)

:OPTION-wsl
IF "%~1" == "-wsl" (
  wsl
  Exit
)

:UPDATEALL
IF "%~1" == "--update" (
  Echo -^> pacman -Suy
  %where_is_msys64_folder%\usr\bin\pacman.exe -Suy
  Echo -^> git update-git-for-windows
  git update-git-for-windows
  Echo -^> wsl --update
  wsl --update
  Echo -^> wsl sudo apt update ^&^& sudo apt upgrade
  wsl sudo apt update ^&^& sudo apt upgrade
  Exit
)

:OPTION-update
IF "%~1" == "-msys2-update" (
  Echo -^> pacman -Suy
  %where_is_msys64_folder%\usr\bin\pacman.exe -Suy
  Exit
)
IF "%~1" == "-git-update" (
  Echo -^> git update-git-for-windows
  git update-git-for-windows
  Exit
)
IF "%~1" == "-wsl-update" (
  Echo -^> wsl --update
  wsl --update
  Echo -^> wsl sudo apt update && sudo apt upgrade
  wsl sudo apt update ^&^& sudo apt upgrade
  Exit
)

:OPTION-help
IF "%~1" == "-h" (
@Echo off
  Call :F-help
  Exit
)
IF "%~1" == "-H" (
  Call :F-help
  Exit
)
IF "%~1" == "-?" (
  Call :F-help
  Exit
)
IF "%~1" == "-help" (
  Call :F-help
  Exit
)
IF "%~1" == "--help" (
  Call :F-help
  Exit
)
IF "%~1" == "/?" (
  Call :F-help
  Exit
)

Exit

:F-path
SET "path=%__CD__%"
IF "x%~2" == "x" (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE IF "x%~2" == "x." (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE IF "x%~2" == "xhere" (
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
) ELSE IF "x%~2" == "x.." (
  Call SET "path=%__CD__%\.."
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which% ..
  Exit
) ELSE (
  cd %~2
  SET "path=%__CD__%\.."
  %where_is_msys64_folder%\msys2_shell.cmd -defterm -here -no-start %which%
  Exit
)

:F-help
Echo.
Echo Usage:      cbash [option] [path]
Echo.
Echo Default: -^> cbash [-msys2-mingw64] [C:\current\dir]
Echo.
Echo Option:
Echo     -msys2[-msys] ^| -msys2-mingw32 ^| -msys2-mingw64 ^| -msys2-ucrt64 ^| -msys2-clang64
Echo     -msys2-update
Echo.
Echo     -git
Echo     -git-update
Echo.
Echo     -wsl
Echo     -wsl-update
Echo.
Echo     -h ^| -H ^| -? ^| -help ^| --help ^| /?
Echo.
Echo Update:      03/09/2023
Echo     [-git] not work
Echo     [] [path] not work
Echo.

Exit
