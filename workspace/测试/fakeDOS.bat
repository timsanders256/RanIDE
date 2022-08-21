@echo off

echo.
echo -----------------------------------
echo  Command Processor Emulator Animation
echo -----------------------------------
echo Loading . . .  This can take a few seconds.
:fakedosload
cls
set /a n=%n%+1
echo Starting: Fake DOS . . .  %n%%%
if %n% GEQ 100 goto fakedos
goto fakedosload
:fakedos
echo Fake Dos Animation Done