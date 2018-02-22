::Script to collect information about a computer.

@ECHO OFF

:MENU

ECHO ========== PowerShell Scrypt Toggle ==========
ECHO. 
ECHO 1. Show Current Setting
ECHO 2. Set to Unrestricted.
ECHO 3. Set to Restricted.
ECHO 4. Gather information.
ECHO 5. Exit
ECHO.
ECHO ==============================================

::Input Process
SET INPUT=
SET /P INPUT=Select an Option [1-4]:

IF /I '%INPUT%'=='1' GOTO SHOW
IF /I '%INPUT%'=='2' GOTO UNRE
IF /I '%INPUT%'=='3' GOTO REST
IF /I '%INPUT%'=='4' GOTO RUN
IF /I '%INPUT%'=='5' GOTO EOF


::Show Powershell Script Mode
:SHOW
    CLS
    CALL :ECH
    ECHO | set /P=The current Execution Policy is:  
    powershell -command "& {Get-ExecutionPolicy}"
    CALL :ECH
GOTO MENU


::Unrestrict Powershell Exec Policy
:UNRE
    CLS
    powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
    CALL :ECH
    ECHO Changing Execution Policy...
    sleep 1
    ECHO | set /P=The current Execution Policy is now: 
    powershell -command "& {Get-ExecutionPolicy}"
    CALL :ECH
GOTO MENU

:REST
    CLS
    powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Restricted -Force}"
    CALL :ECH
    ECHO Changing Execution Policy...
    sleep 1
    ECHO | set /P=The current Execution Policy is now: 
    powershell -command "& {Get-ExecutionPolicy}"
    CALL :ECH
GOTO MENU

:RUN
    CALL :ECH
    ECHO Collecting Information...
    powershell -noexit -command "& 'C:\Users\uduran\Documents\Website\info.ps1'"
    sleep 1
    CALL :ECH
    ECHO Done!
    CALL :ECH
    sleep 1
GOTO MENU 



::Other functions cut down code reuse.
:ECH
    ECHO.
    ECHO.