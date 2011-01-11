@if not exist "%CD%\..\.ps3\README" goto missing
@if not exist "%CD%\..\ps3tools\pkg.exe" goto missing
@if not exist "%CD%\pup.exe" goto missing

@setlocal
@call c:\msys\1.0\bin\sed --version | find "GNU sed version 3.02" > null
@if %ERRORLEVEL% == 0 goto upgrade_sed
@endlocal

@setlocal
@echo off
set TOOLS=C:\MinGW\bin;C:\msys\1.0\bin;..\ps3tools;..\ps3utils;
set PATH=%TOOLS%;%PATH%
set HOME=%CD%\..
bash create_cfw.sh PS3UPDAT.PUP CFW.PUP
@endlocal
@goto :eof

:upgrade_sed
@setlocal
@echo off
echo.
echo """""""""""""""""" UPDATE REQUIRED """"""""""""""""""
echo " Currently installed version of `sed` is too old!  "
echo " A newer version is available at SourceForge.net   "
echo "                                                   "
echo " http://gnuwin32.sourceforge.net/packages/sed.htm  "
echo "                                                   "
echo " Download the following zip files................  "
echo " Binaries                                          "
echo " Dependencies                                      "
echo "                                                   "
echo " Replace the current version located in..........  "
echo " `C:\msys\1.0\bin`                                 "
echo """""""""""""""""""""""""""""""""""""""""""""""""""""
echo.
@endlocal
@goto :eof

:missing
@setlocal
@echo off
set OLD_CWD=%CD%
cd %CD%\..
echo.
echo """""""""""""""""""""""""""""""""""""""""""""""""""""
echo " The following directory structure is required for "
echo " building your own CFW.                            "
echo "                                                   "
echo "   ---> %CD%
echo "      |---> .ps3/                                  "
echo "      |---> ps3tools/ (Run Makefile)               "
echo "      |---> ps3utils/ (Run Makefile)               "
echo "                                                   "
echo """""""""""""""""""""""""""""""""""""""""""""""""""""
cd %OLD_CWD%
@endlocal
@goto :eof
