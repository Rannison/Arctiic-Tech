@echo off
title NETWORK RESET SCRIPT
:prompt
color 0c
cls
echo NETWORK RESET SCRIPT
echo.
echo Type r to Reset Network
echo Type p to do a ping test
echo Type c to go to Command Prompt
echo Type q to exit
set /p answer=
if ‘%answer%’ == ‘r’ goto test
if ‘%answer%’ == ‘R’ goto test
if ‘%answer%’ == ‘C’ goto cmd
if ‘%answer%’ == ‘c’ goto cmd
if ‘%answer%’ == ‘q’ goto quit
if ‘%answer%’ == ‘Q’ goto quit
if ‘%answer%’ == ‘P’ goto ping
if ‘%answer%’ == ‘p’ goto ping
pause >nul

:test
cls
echo —————————————————-
echo – RELEASING IP…. –
echo —————————————————-
ipconfig /release >nul
echo.
echo Done!
echo.
echo —————————————————-
echo – RESETTING IP LOG… –
echo —————————————————-
@netsh int ip reset
@netsh int ip reset C:WindowsTEMPIPRESETLOG.txt >nul
echo.
echo Done!
echo.
echo —————————————————-
echo – FLUSHING ARP TABLES… –
echo —————————————————-
@arp -d >nul
echo.
echo Done!
echo.
echo —————————————————-
echo – FLUSHING DNS… –
echo —————————————————-
@ipconfig /flushdns >nul
echo.
echo Done!
echo.
echo —————————————————-
echo – RENEWING IP… –
echo —————————————————-
@ipconfig /renew >nul
echo.
echo Done!
echo.
echo —————————————————-
echo Heres Your Status: –
echo —————————————————-
ipconfig /all
echo.
echo Press Any Key to Go To Menu
pause >nul
goto prompt

:ping
cls
echo —————————————————-
echo Starting Internet Ping Test… –
echo —————————————————-
echo.
ping 8.8.8.8
echo.
echo Press Any Key to goto MENU
pause >nul
goto prompt

:quit
cls
echo Thanks For Using The Network Reset Script
pause
exit

:cmd
@color 0c
cls
cmd
@echo on