@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   dsh-chat-timeline-plus 一键安装
echo ========================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
echo.
pause
