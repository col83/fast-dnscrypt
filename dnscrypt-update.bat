@echo off

set URL=https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.12/dnscrypt-proxy-win64-2.1.12.zip
set TEMP=%USERPROFILE%\AppData\Local

cls
echo.

echo Downloading dnscrypt binary
.\curl -fJL -# -o "%TEMP%\dnscrypt-proxy.zip" %URL% && goto extract || exit 1

:extract
IF EXIST ".\dnscrypt-proxy" (rd /s /q ".\dnscrypt-proxy" & timeout 1)
.\7za.exe e "%TEMP%\dnscrypt-proxy.zip" -o"%CD%\dnscrypt-proxy\" -ssp -Y
rd /q ".\dnscrypt-proxy\win64"

cd .\dnscrypt-proxy\
copy example-dnscrypt-proxy.toml dnscrypt-proxy.toml
copy example-captive-portals.txt captive-portals.txt

echo.
pause
