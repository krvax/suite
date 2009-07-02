@echo off
cls
set gs=0 >nul 2>nul
echo Please wait while GeoServer starts for the first time...

:try
if %gs%==60 goto fail
set /a gs+=1
netstat -an | findstr /RC:":8080 .*LISTENING" >NUL && set gs=start
ping 127.0.0.1 -n 2 -w 1000 > nul
if %gs%==start goto success else goto try
goto try

:success
set gs="" >nul 2>nul
echo GeoServer started!
goto end

:fail
set gs="" >nul 2>nul
echo ERROR: GeoServer could not be started.

:end