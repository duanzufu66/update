@echo off
chcp 65001 >nul
cd /d %~dp0
set GIT=C:\Program Files\Git\cmd\git.exe
if not exist "%GIT%" set GIT=git

echo ============================================
echo   MM-CrossBook 1-key upload GitHub (publish new version)
echo ============================================
echo   Check: new APK placed in mm-crossbook folder,
echo   version.json edited (versionCode +1, new name, new file).
echo.
"%GIT%" add .
"%GIT%" commit -m "update %date% %time%"
"%GIT%" push origin main
echo.
if %errorlevel%==0 (
    echo [OK] uploaded to GitHub. Wait 1~3 min, phone can check update.
) else (
    echo [FAIL] if nothing to commit = no changes; other errors check network.
)
echo.
pause
