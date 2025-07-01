@echo off
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    goto patch
) else (
    goto error
)



:error
echo.
echo Error: run as admin
echo.
pause
goto end

:patch
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\POLICIES\MICROSOFT\Windows\NetworkConnectivityStatusIndicator" /v UseGlobalDNS /t REG_DWORD /d 1 /f
exit 0

:end
exit 1