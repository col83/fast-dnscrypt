@echo off
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    goto unpatch
) else (
    goto error
)



:error
echo.
echo Error: run as admin
echo.
pause
goto end

:unpatch
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\POLICIES\MICROSOFT\Windows\NetworkConnectivityStatusIndicator" /v UseGlobalDNS /f
exit 0

:end
exit 1