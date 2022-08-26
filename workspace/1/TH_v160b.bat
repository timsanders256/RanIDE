@echo off
REM To anyone who are viewing this source code,
REM Thank you so much for downloading this game!
REM BTW, It's highly recommended to use Notepad++ to view the source code
REM Because I created this game on Notepad++. I love syntax highlighting :3
REM But Notepad can view the special characters using "Terminal" font...
REM Here are some special characters: 
REM Blocks: 1/4[°] 1/2[±] 3/4[²] full[Û]
REM Box drawings:
REM ºÍÉ»È¼

REM Oh, and here is the only config :P
REM ===============

set localsave=NOPE!

REM ===============
REM If true, your saves are pretty much portable now, just don't
REM forget to bring the Touhou_00 folder along with this game!

REM The game hi-scores and saves will be now at Touhou_00 foler
REM at current dictionary of this game unless you set localsave
REM as something else, which will be then in Documents folder.
REM Since we have .BAT and .CMD which do the same thing,
REM I made .CMD as Hi-Scores and .BAT as player game saves
REM It's very useful and has no conflicts to game saves! THANKS, MICRO$OFT!

REM Lines Count: findstr /r /n "^" %0 | find /C ":"

REM Fun fact: The actual game is almost in the other half of the code
REM Due to me being wanted to include all other stuff in a single file :P

REM Touhou score has 9 fixed digits
:commandcomcheck
REM == COMMAND.COM/EXTENSIONS CHECK ==
set n=5
set /a n=(10*5/10+15-5)*3-45
REM There is no /a switch on MS-DOS.
if %n%==0 goto cd7
CLS
ECHO Oops, look like your Command Prompt disabled Command Extensions.
ECHO This game involves calculations, which use Command Extensions.
ECHO Also, it won't be ported, because there are no workarounds.
ECHO Press any key for an attempt to enable Command Extensions . . .
PAUSE 1>NUL
setlocal enableextensions
set n=5
set /a n=(10*5/10+15-5)*3-45
if %n%==0 goto cd7
CLS
ECHO Aww, Damnit! it seem that your Command Prompt is screwed up. D:
ECHO Tough luck, though, you might need to reinstall Windows, I don't know...?
ECHO.
ECHO From a single case, this won't work with Wine (Without Command Extensions)
ECHO.
ECHO If you wonder why, "SET /a" is only available with Command Extensions.
ECHO Please post "It refused to work!" to my thread. Also tell your OS used.
ECHO Tip: You can right click on this game and click Edit.
ECHO.
ECHO But hey, just for the heck out of it, we'll continue until this prompt closes!
PAUSE
REM The following is for save dictionary

:cd7
if "%localsave%"=="true" goto cdboth
if not exist "%userprofile%\Documents" ( cd /d %userprofile%\My Documents) & goto cdboth
cd /d "%userprofile%\Documents"
goto cdboth
:cdboth
if exist batch_touhou_saves if not exist Touhou_00 ren batch_touhou_saves Touhou_00
REM For the sake of older players :)
if not exist Touhou_00 md Touhou_00

REM This is for Windows XP users only.
if exist choice.exe move choice.exe Touhou_00\choice.exe
REM Put Choice.EXE to my documents folder.
cd Touhou_00
if not exist main-high.cmd echo set /a stat12hi=100000 1>main-high.cmd
:cmdendload
title Command Processor Emulator
echo.
echo -----------------------------------
echo  Command Processor Emulator v0.9.1
echo -----------------------------------
echo Loading . . .  This can take a few seconds.
PING www.youtube.com -n 3 -w 500 | find "bytes=32" >nul
REM Oops, May not work for languages other than English...
IF NOT ERRORLEVEL 1 set hasnet=1
IF     ERRORLEVEL 1 set hasnet=0
:fakedosload
cls
set /a n=%n%+1
echo Starting: NitorizingDOS . . .  %n%%%
if %n% GEQ 100 goto fakedos
goto fakedosload
:fakedos
title Command Processor Emulator: NitorizingDOS
for /f "delims=" %%a in ('ver ^| findstr /v "macintosh"') do set cmdreal=%%a
color 1f
cls
echo -------------------------------------------------------
echo  Emulated with %cmdreal%
echo -------------------------------------------------------
echo NitorizingDOS [Version 2.2.5702] - Current date: %date%
echo Copyright (c) Nitori Kawashiro. All rights reserved.
:fakedos0
echo.
set var=BUGFIX
echo %~s0 - Execute? [Y/N/SKIP]
set /p var=^>
REM Critcal variable that needs to be loaded first.
set fi2=0
set fi1=E
set lastcolor=%fi2%%fi1%
set n=0
set started=no
set faqopt0t=False
set nulcom=no
set loadmode=0
set used0=0
set nochoice=no
choice /t 0 /c yn /d n >nul 2>&1
if not %ERRORLEVEL%==2 set nochoice=yes

if /i "%var%"=="y" goto load
if /i "%var%"=="n" exit
if /i "%var%"=="skip" goto load
if "%var%"=="BASIC" goto fakebasic
goto fakedos0
:fakebasic
mode 40,25
color 3B
title Commondore 64
echo.
echo     **** COMMODORE 64 BASIC V2 ****
echo.
echo  64K RAM SYSTEM  38911 BASIC BYTES FREE
echo.
echo READY.
:fakebasic1
ping localhost -n 2 >nul
set /p var=LOAD 
echo.
if /i "%var%"==""touhou",8,1" goto fakebasicfind0
if /i "%var%"==""touhou*",8,1" goto fakebasicfind1
if /i "%var%"==""t*",8,1" goto fakebasicfind2
if /i "%var%"=="batch" ( mode 80,25) & goto fakedos
echo ?TRY AGAIN  ERROR
echo.
echo READY.
goto fakebasic1
:fakebasicfind0
echo SEARCHING FOR TOUHOU
goto fakebasic0
:fakebasicfind1
echo SEARCHING FOR TOUHOU*
goto fakebasic0
:fakebasicfind2
echo SEARCHING FOR T*
goto fakebasic0
:fakebasic0
ping localhost -n 4 >nul
echo LOADING
ping localhost -n 5 >nul
echo READY.
ping localhost -n 2 >nul
echo RUN
ping localhost -n 3 >nul
mode 80,25
title Touhou 00 - Blindness of Observer
goto preplay1
:load
cls
echo Loading File . . .  %n%%%
:loada
set /a na+=1
if %na%==2 goto load0
goto loada
:load0
set /a n+=1
if /i "%var%"=="skip" set /a n+=1
set /a na=0
if %n%==64 goto loadd
goto load
:loadd
cls
echo Loading File . . .  %n%%%
:loadda
set /a na+=+1
if %na%==4 goto load1
goto loadda
:load1
set /a n+=1
if /i "%var%"=="skip" set /a n+=1
set /a na=0
if %n%==80 goto loaddd
goto loadd
:loaddd
cls
echo Loading File . . .  %n%%%
set /a n+=1
if /i "%var%"=="skip" set /a n+=1
if %n%==100 goto preplay
goto loaddd
:preplay
set n=0
set na=0
cls
color 0E
title Touhou 00 - Blindness of Observer
if /i "%var%"=="skip" goto play
echo.
echo.
echo.
echo.
echo.
echo 	      ####   ####  #####  ### #####  ####### ###### #####
echo 	     #    # #    # #    #  #  #    #    #    #      #    #
echo 	     #      #      #    #  #  #    #    #    #      #    #
echo 	      ####  #      #####   #  #####     #    #####  #    #
echo 	          # #      #  #    #  #         #    #      #    #
echo 	     #    # #    # #   #   #  #         #    #      #    #
echo 	      ####   ####  #    # ### #         #    ###### #####
echo.
echo 	     ### #     #       #####   ####  #######  ####  #    #
echo 	      #  ##    #       #    # #    #    #    #    # #    #
echo 	      #  # #   #       #    # #    #    #    #      #    #
echo 	      #  #  #  #       #####  ######    #    #      ######
echo 	      #  #   # #       #    # #    #    #    #      #    #
echo 	      #  #    ##       #    # #    #    #    #    # #    #
echo 	     ### #     #       #####  #    #    #     ####  #    # 
:preplay0
set /a bb=%bb%+1
set /a aa=%random%/4096
if %aa%==2 set aa1=9
if %aa%==3 set aa1=A
if %aa%==4 set aa1=B
if %aa%==5 set aa1=C
if %aa%==6 set aa1=D
if %aa%==7 set aa1=E
if %aa%==8 set aa1=F
if %aa% LSS 2 goto preplay0
color 0%aa1%
if %bb% GTR 150 ( set bb=0) & goto preplay0a
goto preplay0
:preplay0a
set /a bb=%bb%+1
set /a aa=(%random%/4096)+1
color 0%aa%
if %bb% GTR 50 ( set bb=0) & goto preplay1
goto preplay0a
:preplay1
cls
color 08
ping localhost -n 2 >nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 		       -- The Ukimenustah Productions --
echo 		        Est. Release date: Winter 2012
echo.
echo 	    Please Support Me! -^> http://batchtouhougames.webs.com
echo.
echo.
echo.
if %nochoice%==yes echo          Notice: Certain features had to be disabled under Windows XP.
if %nochoice%==yes echo         Reason: choice.exe cannot be found. Running in Windows XP mode.
ping localhost -n 2 >nul
color 07
ping localhost -n 2 >nul
color 0f
ping localhost -n 4 >nul
color 07
ping localhost -n 2 >nul
color 08
ping localhost -n 2 >nul
cls
ping localhost -n 2 >nul
color 0f
for /l %%g in (0,1,30) do echo.

for /l %%g in (0,1,200) do echo Nothing>nul
echo 	    _______   _______   __   __   __   __   _______   __   __
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	   /__  __/\ / ___  /\ / /\ / /\ / /\ / /\ / ___  /\ / /\ / /\
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	   \_/ / _\// /\_/ / // / // / // /_// / // /\_/ / // / // / /
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	    / / /  / / // / // / // / // ___  / // / // / // / // / /
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	   / / /  / /_// / // /_// / // /\_/ / // /_// / // /_// / /
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	  /_/ /  /______/ //______/ //_/ //_/ //______/ //______/ /
for /l %%g in (0,1,200) do echo Nothing>nul
echo 	  \_\/   \______\/ \______\/ \_\/ \_\/ \______\/ \______\/
for /l %%g in (0,1,200) do echo Nothing>nul
echo.
for /l %%g in (0,1,200) do echo Nothing>nul
echo 			       - F A N  G A M E -
for /l %%g in (0,1,200) do echo Nothing>nul
echo.
for /l %%g in (0,1,200) do echo Nothing>nul
echo.
for /l %%g in (0,1,200) do echo Nothing>nul
echo.
for /l %%g in (0,1,200) do echo Nothing>nul
echo.
for /l %%g in (0,1,300) do echo Nothing>nul
echo 		    / In Development Since June 17, 2011. /
for /l %%g in (0,1,400) do echo Nothing>nul
echo.
for /l %%g in (0,1,500) do echo Nothing>nul
echo 		    Original By: Team Shanghai Alice  (ZUN)
for /l %%g in (0,1,600) do echo Nothing>nul
echo 		  - This game is completely Non-Commercial. -
ping localhost -n 5 >nul
color 07
ping localhost -n 2 >nul
color 08
ping localhost -n 2 >nul
cls
ping localhost -n 2 >nul
color %lastcolor%
:play
if %started%==no set stat12=0
call :SCORESP
set /a stat12hi0=%stat12hi%/10
if %hasnet%==0 set stat12last=O
if %hasnet%==1 set stat12last=0
cls
echo  ===================== Touhou 00 - Blindness of Observer ======================
echo    Copyright 2011-12 Ukimenustah  [Open-Source]  Beta V1.6.0  80x25 Text mode
if %started%==no echo  =================================================== Hi-Score  %stat12hisp%%stat12hi0%%stat12last% ======
if %started%==yes echo  ==============================================================================
REM The last digit tell you if you have the internet connection.
echo Known Bugs:
echo - Entering odd numbers of double quotes (") exits the game.
echo - Loading a save or restarting the game increase subroutine level by one.
echo.
echo V1.6.0 Update: - Main menu now stylized below! (Except for Windows XP users)
echo  - Tea from defeated Sakuya added! Also, no tea was also added!
:menu
if %nochoice%==no goto menu160
set var=BUGFIX
echo.
if %started%==yes echo [resume] Back to your current game.
if %started%==no echo [start] Game Start!
if %started%==yes echo [start] Restart from beginning.
echo [load] Load game.
echo [delete] Delete saved game.
echo [minigame] Cirno Training
echo [faq] Go to FAQ.
REM echo [version number] See this game's versioning.
echo [color] Color options.
echo [clear] Clear screen per Command: %faqopt0t%
echo [extra] Extras (Omake).
echo [credits] View the credits for this game.
echo [license] View self-made version of license.
echo [quit] Exit the game.
set /p var=^>
if /i "%var%"=="resume" if %started%==yes goto gCLS
if /i "%var%"=="start" goto intro
if /i "%var%"=="load" call :gameloadmenu
if /i "%var%"=="delete" call :gamedeletemenu
if /i "%var%"=="minigame" goto minigameintro
if /i "%var%"=="faq" goto faq
if /i "%var%"=="color" goto color
if /i "%var%"=="credits" goto credits
if /i "%var%"=="clear" goto clsoption
if /i "%var%"=="extra" goto extramenu
if /i "%var%"=="license" goto exactlicense
if /i "%var%"=="quit" call :quit
if /i "%var%"=="promptcmd!" goto thecommandprompt
if /i "%var%"=="power level is over 9000!" goto intro
REM Removed...
goto play
:menu160
if %used0%==1 goto menu160a
for /l %%g in (0,1,11) do set sel%%g=
if "%ptr0a%"=="" set sel1=^^^>
if "%ptr0a%"=="" ( set ptr0=1) else ( set ptr0=%ptr0a%)
if %started%==no if %ptr0%==0 set ptr0=1
if %started%==yes set ptr0=0
:menu160a
set sel%ptr0a%=
set sel%ptr0%=^^^>
echo.
if %started%==yes echo   %sel0% Resume game
if %started%==no echo    %sel1% Game Start!
if %started%==yes echo    %sel1% Restart game
echo     %sel2% Load game
echo      %sel3% Delete saved game
echo       %sel4% Cirno Training
echo        %sel5% Frequently Asked Questions
echo         %sel6% Color options
echo          %sel7% Clear screen per Command: %faqopt0t%
echo           %sel8% Extras (Omake)
echo            %sel9% Credits
echo             %sel10% Author's license
echo              %sel11% Quit game 		   O - Up     L - Down     Z - Select
:menu160b
set used0=1
choice /c olz >nul
set ptr0a=%ptr0%
if %errorlevel%==1 set /a ptr0-=1
if %errorlevel%==2 set /a ptr0+=1
if %errorlevel%==3 goto menu160c
if %ptr0% LSS 1 if %started%==no set ptr0=11
if %ptr0% LSS 0 if %started%==yes set ptr0=11
if %ptr0% GTR 11 if %started%==no set ptr0=1
if %ptr0% GTR 11 if %started%==yes set ptr0=0
goto play
:menu160c
set used0=0
if %ptr0%==0 goto gCLS
if %ptr0%==1 goto intro
if %ptr0%==2 call :gameloadmenu
if %ptr0%==3 call :gamedeletemenu
if %ptr0%==4 goto minigameintro
if %ptr0%==5 goto faq
if %ptr0%==6 goto color
if %ptr0%==7 goto clsoption
if %ptr0%==8 goto extramenu
if %ptr0%==9 goto credits
if %ptr0%==10 goto exactlicense
if %ptr0%==11 call :quit
set used0=1
goto play
:gameloadmenu
REM I cleaned up the code Since beta 1.0.1
set saveload=NuLl
cls
echo === Game Saves ===
for %%i in (*.bat) do echo %%~ni
echo.
set /p saveload=Load Game: 
if "%saveload%"=="NuLl" goto :eof
if exist "%saveload%.bat" goto gameloading
echo.
echo Save does not exist.
ping localhost -n 2 >nul
goto gameloadmenu

:gameloading
set loadmode=1
set diff=1
call :intro0
call "%saveload%"
set loadmode=0
REM Beta 1.5.2 Change: Now use starting values first, then load the save.
REM Problems from older saves like missing values is fixed.
echo.
echo Game loaded sucessfully.
goto %lastplace%

:gamedeletemenu
set saveload=NuLl
cls
echo === Game Saves ===
for %%i in (*.bat) do echo %%~ni
echo.
set deleted=no
set /p saveload=Delete Game: 
if "%saveload%"=="NuLl" goto :eof
if exist "%saveload%.bat" set deleted=yes
if exist "%saveload%.bat" del "%saveload%.bat"
echo.
if %deleted%==yes ( echo Save deleted.) else ( echo Save does not exist.)
ping localhost -n 3 >nul
goto gamedeletemenu

:clsoption
if /i %faqopt0t%==False ( set faqopt0=n) & ( set faqopt0t=True) & goto play
if /i %faqopt0t%==True ( set faqopt0=) & ( set faqopt0t=False) & goto play
:versioning
cls
echo === Game versioning of the creator ===
echo V[statenumber].[major].[minor][state]
echo Examples: V0.8.2a   V1.2.0b
echo 0/a=Alpha.  1/b=Beta.
echo statenumber and state is just the 2 different ways to tell the version.
echo.
echo When statenumber is 2:
echo V2.0.x=Release candidate (RC)
echo V2.1=Finished version
echo.
echo Minor version number are bug fixes or new features in development.
echo It's still far from RC.
goto menu
:color
REM Do not GOTO colormenu
if %fi2%==0 set fi2n=black
if %fi2%==1 set fi2n=navy
if %fi2%==2 set fi2n=green
if %fi2%==3 set fi2n=teal
if %fi2%==4 set fi2n=dark red
if %fi2%==5 set fi2n=purple
if %fi2%==6 set fi2n=olive
if %fi2%==7 set fi2n=silver
if %fi2%==8 set fi2n=grey
if %fi2%==9 set fi2n=blue
if %fi2%==A set fi2n=bright green
if %fi2%==B set fi2n=cyan
if %fi2%==C set fi2n=red
if %fi2%==D set fi2n=magenta
if %fi2%==E set fi2n=yellow
if %fi2%==F set fi2n=white
if %fi1%==0 set fi1n=Black
if %fi1%==1 set fi1n=Navy
if %fi1%==2 set fi1n=Green
if %fi1%==3 set fi1n=Teal
if %fi1%==4 set fi1n=Dark red
if %fi1%==5 set fi1n=Purple
if %fi1%==6 set fi1n=Olive
if %fi1%==7 set fi1n=Silver
if %fi1%==8 set fi1n=Grey
if %fi1%==9 set fi1n=Blue
if %fi1%==A set fi1n=Bright green
if %fi1%==B set fi1n=Cyan
if %fi1%==C set fi1n=Red
if %fi1%==D set fi1n=Magenta
if %fi1%==E set fi1n=Yellow
if %fi1%==F set fi1n=White
:colormenu
cls
set var=BUGFIX
echo ==== Color Options ====
echo Color: %fi2%%fi1% - %fi1n% on %fi2n%
echo [1] Change text color
echo [2] Change background color
echo [3] Random text color
echo [4] Random background color
echo [5] Random colors
echo [6] Reset to default color
echo [7] Cycle through 16 colors
echo [menu] Go back to main menu.
set /p var=^>
if "%var%"=="1" goto color0
if "%var%"=="2" goto color1
if "%var%"=="3" goto color2
if "%var%"=="4" goto color3
if "%var%"=="5" goto color4
if "%var%"=="6" goto color5
if "%var%"=="7" goto color6
if /i "%var%"=="menu" goto play
goto color
:color0
cls
set var2=BUGFIX
echo Choose text color:
echo [0] Black    [8] Grey
echo [1] Navy     [9] Blue
echo [2] Green    [a] Bright green
echo [3] Teal     [b] Cyan
echo [4] Dark red [c] Red
echo [5] Purple   [d] Magenta
echo [6] Olive    [e] Yellow
echo [7] Silver   [f] White
set /p var2=^>
if "%var2%"=="BUGFIX" goto color
set fi1last=%fi1%
if "%var2%"=="0" set fi1=0
if "%var2%"=="1" set fi1=1
if "%var2%"=="2" set fi1=2
if "%var2%"=="3" set fi1=3
if "%var2%"=="4" set fi1=4
if "%var2%"=="5" set fi1=5
if "%var2%"=="6" set fi1=6
if "%var2%"=="7" set fi1=7
if "%var2%"=="8" set fi1=8
if "%var2%"=="9" set fi1=9
if /i "%var2%"=="A" set fi1=A
if /i "%var2%"=="B" set fi1=B
if /i "%var2%"=="C" set fi1=C
if /i "%var2%"=="D" set fi1=D
if /i "%var2%"=="E" set fi1=E
if /i "%var2%"=="F" set fi1=F
if %fi2%==%fi1% ( set fi1=%fi1last%) & goto color0
color %fi2%%fi1%
goto color
:color1
cls
set var=BUGFIX
echo Choose background color:
echo [0] Black    [8] Grey
echo [1] Navy     [9] Blue
echo [2] Green    [a] Bright green
echo [3] Teal     [b] Cyan
echo [4] Dark red [c] Red
echo [5] Purple   [d] Magenta
echo [6] Olive    [e] Yellow
echo [7] Silver   [f] White
set /p var=^>
if "%var%"=="BUGFIX" goto color
set fi2last=%fi2%
if "%var%"=="0" set fi2=0
if "%var%"=="1" set fi2=1
if "%var%"=="2" set fi2=2
if "%var%"=="3" set fi2=3
if "%var%"=="4" set fi2=4
if "%var%"=="5" set fi2=5
if "%var%"=="6" set fi2=6
if "%var%"=="7" set fi2=7
if "%var%"=="8" set fi2=8
if "%var%"=="9" set fi2=9
if /i "%var%"=="A" set fi2=A
if /i "%var%"=="B" set fi2=B
if /i "%var%"=="C" set fi2=C
if /i "%var%"=="D" set fi2=D
if /i "%var%"=="E" set fi2=E
if /i "%var%"=="F" set fi2=F
if %fi2%==%fi1% ( set fi2=%fi2last%) & goto color1
if %fi2%==%fi1% goto color1
color %fi2%%fi1%
goto color
:colorhexfi1
if %fi1%==10 set fi1=A
if %fi1%==11 set fi1=B
if %fi1%==12 set fi1=C
if %fi1%==13 set fi1=D
if %fi1%==14 set fi1=E
if %fi1%==15 set fi1=F
goto :eof
:colorhexfi2
if %fi2%==10 set fi2=A
if %fi2%==11 set fi2=B
if %fi2%==12 set fi2=C
if %fi2%==13 set fi2=D
if %fi2%==14 set fi2=E
if %fi2%==15 set fi2=F
goto :eof
:color2
set /a fi1=%random%/2048
call :colorhexfi1
if %fi1%==%fi2% goto color2
color %fi2%%fi1%
goto color
:color3
set /a fi2=%random%/2048
call :colorhexfi2
if %fi2%==%fi1% goto color3
color %fi2%%fi1%
goto color
:color4
set /a fi1=%random%/2048
call :colorhexfi1
set /a fi2=%random%/2048
call :colorhexfi2
if %fi2%==%fi1% goto color4
color %fi2%%fi1%
goto color
:color5
set fi2=0
set fi1=E
color %fi2%%fi1%
goto color
:color6
cls
color 0f
ping localhost -n 2 >nul
color 1f
ping localhost -n 2 >nul
color 2f
ping localhost -n 2 >nul
color 3f
ping localhost -n 2 >nul
color 4f
ping localhost -n 2 >nul
color 5f
ping localhost -n 2 >nul
color 6f
ping localhost -n 2 >nul
color 7f
ping localhost -n 2 >nul
color 8f
ping localhost -n 2 >nul
color 9f
ping localhost -n 2 >nul
color af
ping localhost -n 2 >nul
color bf
ping localhost -n 2 >nul
color cf
ping localhost -n 2 >nul
color df
ping localhost -n 2 >nul
color ef
ping localhost -n 2 >nul
color fa
ping localhost -n 2 >nul
if "%fi2%"=="" ( color 0A) & ( goto color)
if "%fi1%"=="" ( color 0A) & ( goto color)
color %fi2%%fi1%
goto color

:extramenu
cls
set var=BUGFIX
echo ==== Extras ====
echo This extra section contains various Batch creations.
echo.
echo [1] CMD benchmark
echo [2] Time unit converter
echo [3] Fibonacci generator
echo [4] Decimal Handling
REM echo [5] Source code statistics
echo [a] CMD Fullscreen issues
REM echo [b] Command Prompt - cmd.exe alike
REM echo [b] Expected game ratings
echo [menu] Back to main menu
set /p var=^>
if "%var%"=="1" goto benchmark
if "%var%"=="2" goto timeconverter
if "%var%"=="3" goto fibonacci
if "%var%"=="4" goto decimals
REM if "%var%"=="5" goto sourcecodecounter
if /i "%var%"=="a" goto fullscreenreason
REM if /i "%var%"=="b" goto thecommandprompt
REM if /i "%var%"=="b" goto ratings
if /i "%var%"=="menu" goto play
goto extramenu
:ratings
echo.
echo === Expected game rating (NOT BEING RATED YET!) ===
echo ESRB: Expected  E
echo PEGI: Expected  3
echo OFLC: Expected  G
echo TIGRS: Will be  Family Friendly
echo EOCS: Expected  All Ages (Or A for CERO)
pause
goto extramenu
:sourcecodecounter
cls
echo === Source code statistics ===
echo These aren't pre-written!
echo Total lines of the entire file
findstr /r /n "^" %0 | find /C ":"
echo.
echo Total base ECHO commands used
findstr /r /n "^echo" %0 | find /C ":"
echo.
echo Total base SET commands used
findstr /r /n "^set" %0 | find /C ":"
echo.
echo Total base IF statements used
findstr /r /n "^if" %0 | find /C ":"
echo.
echo Total base GOTO commands used
findstr /r /n "^goto" %0 | find /C ":"
echo.
echo Total lines of comments (REM)
findstr /r /n "^REM" %0 | find /C ":"
echo.
echo Total :labels used
findstr /r /n "^:" %0 | find /C ":"
echo.
pause
goto extramenu
:thecommandprompt
cls
echo Now, this is the Command Prompt. Type quit to return.
:thecommandprompt0
set thecmd=
set /p thecmd=
if "%thecmd%"=="quit" goto play
%thecmd%
goto thecommandprompt0
:fullscreenreason
echo.
echo === The reason behind systems that does not support CMD's fullscreen mode ===
echo See this blog post: bit.ly/omyFMy  (Note: the long link is insanely long!)
echo TL,DR: Graphic driver on Vista and 7 don't support CMD fullscreen mode.
echo        Disable the graphic driver to make it works.
echo.
pause
goto extramenu
:fibonacci
cls
set m0=0
set m1=1
set m2=
set count=-1
echo ==== Fibonacci number generator ====
echo Real Fibonacci generator, not pre-written into source code!
echo Press any key to calculate.
:fibonacci0
set /a count=%count%+1
set /a m2=%m0%+%m1%
echo f%count% = %m0%
if %m2% GTR 2147483647 goto fibonacciMAX
set m0=%m1%
set m1=%m2%
pause>nul
goto fibonacci0
:fibonacciMAX
echo That's enough. (Number will exceed 2147483647.)
pause
goto extramenu
:decimals
set intdec=6200
set int=6
set dec=200
set dec0=
:decimalsmain
cls
set numin=null
echo ==== Decimal Handling ====
echo Working with non integer number. (but integer input)
echo It doesn't handle negative result yet (handled to 0).
echo Number is: %int%.%dec0%%dec%
echo.
echo Inputed number will be divided by 1000. Quit to exit.
set /p numin=Value: 
if /i "%numin%"=="null" goto decimalsmain
if /i "%numin%"=="quit" goto extramenu
goto decimalscal
:decimalscal
set /a numcal=%numin%
if "%numcal%"=="" goto decimalsmain
REM set /a inte=%numin%/1000+%inte%
REM Screw the overly long code! Rewritten!
set /a intdec+=%numcal%
if %intdec% LSS 1 set intdec=0
set /a int=%intdec%/1000
set /a dec=%intdec%-%int%*1000
set dec0=00
if %dec% GEQ 10 set dec0=0
if %dec% GEQ 100 set dec0=
goto decimalsmain
:benchmark
cls
set /a nums=0
set var=BUGFIX
echo ==== Benchmark ====
echo This'll show you how fast the CPU by looking at how fast the number increases.
echo Don't worry, all loops are finite. All benchmarks end at 900.
echo [1] Addition only, most little code.
echo [2] Similar to above, use FOR /L instead (HYPERSPEED!!).
echo [3] Addition, subtraction, multiplication, division.
echo [4] Addition with small amount of text.
echo [5] Addition with a page filled content. (Not for flicker sensitive.)
echo [6] 1 second addition until 15 minutes. (900 Seconds.)
echo [quit] Exit benchmark.
set /p var=^>
if "%var%"=="1" goto bench0
if "%var%"=="2" goto bench0for
if "%var%"=="3" goto bench3
if "%var%"=="4" goto bench1
if "%var%"=="5" goto bench2
if "%var%"=="6" goto bench4
if /i "%var%"=="quit" goto extramenu
goto benchmark
:bench0
cls
set n=0
:z
echo %n%
set /a n=%n%+1
if %n%==900 goto y
goto z
:y
goto benchmark
:bench0for
cls
for /l %%g in (0,1,90000) do echo %%g
goto benchmark
:bench1
cls
echo How fast the number is the speed. %nums% (ends at 900)
echo Better CPU performance PER CORE means faster speed.
set /a nums=%nums%+1
if %nums%==900 goto benchmark
goto bench1
:bench2
cls
echo Note: This loop is FINITE, it will stops at 900. (Now %nums%.)
echo An infinite loop is a sequence of instructions in a computer
echo program which loops endlessly, either due to the loop having
echo no terminating condition, having one that can never be met,
echo or one that causes the loop to start over. In older operating
echo systems with cooperative multitasking, infinite loops normally
echo caused the entire system to become unresponsive. With the
echo now-prevalent preemptive multitasking model, infinite loops
echo usually cause the program to consume all available processor
echo time, but can usually be terminated by the user. Busy-wait
echo loops are also sometimes misleadingly called "infinite loops".
echo One possible cause of a computer "freezing" is an infinite loop;
echo others include deadlock and access violations. Although infinite
echo loops in a single program are usually easy to predict, a loop
echo caused by several entities interacting is much harder to foresee.
echo Consider a server that always replies with an error message if
echo it does not understand the request. Apparently, there is no
echo possibility for an infinite loop in the server, but if there
echo are two such servers (A and B), and A receives a message of
echo unknown type from B, then A replies with an error message to
echo B, B does not understand the error message and replies to A
echo with its own error message, A does not understand the error
echo message from B and sends yet another error message, and so on ad
echo infinitum. One common example of such situation is an e-mail loop.
set /a nums=%nums%+1
if %nums%==900 goto benchmark
goto bench2
:bench3
cls
set num0=0
set num1=900
set num2=1
set num3=32768
:bench3a
set /a num0=%num0%+1
set /a num1=%num1%-1
set /a num2=%num2%*2
set /a num3=%num3%/2
echo %num0% %num1% %num2% %num3%
if %num0%==900 goto benchmark
if %num1%==0 set /a num1=900
if %num2%==32768 set /a num2=1
if %num3%==1 set /a num3=32768
goto bench3a
:bench4
set /a ap0=%ap0%+1
set /a int=%ap0%/60
set /a dec=%ap0%-%int%*60
set dec0=0
if %dec% GEQ 10 set dec0=
echo %int%:%dec0%%dec%
if %int%==15 ( set ap0=0) & goto benchmark
goto bench4
:exactlicense
cls
echo ==== Author's self-license ====
echo This software is free non-commercial use, with litle restrictions. However,
echo if you copy any portion of this, please give me the credit. (attribution)
echo And commercial use is NOT allowed. (ZUN owns the concepts of Touhou Project
echo while I created it similarly on a Batch File, So, it's not an original game.)
if %nochoice%==yes goto menu
echo.
pause
goto play
:credits
cls
echo ==== Credits ====
echo.
echo  This game is Scripted by
echo  - Ukimenustah [Batch File Script]
echo.
echo  Advanced Scripts by
echo  - The Internet [Internet check, Save/Load, FOR]
echo.
echo  Original Touhou Project Programmed by
echo  - Team Shanghai Alice / ZUN
echo.
echo  Original Game Concept by
echo  - ZUN
echo.
echo  Original Cirno Training created by
echo  - Chibitami [chibitami.net/works]
echo.
echo  -- This game is completely non-commercial --
echo.
echo  If you enjoyed this game, please share to your friends (who knows Touhou.)
echo  Or, please see my thread about this game on Maidens of the Kaleidoscope here:
echo       [ http://www.shrinemaiden.org/forum/index.php/topic,11750.0.html ]
REM But eventually, I may just sign up there and then post about this game.
echo.
pause
goto play
:timeconverter
cls
set var=BUGFIX
echo ==== Time unit converter ====
echo [1] Minutes to seconds
echo [2] Seconds to minutes
echo [3] Minutes to hours
echo [4] Hours to minutes
echo [5] Days to hours
echo [6] Hours to days
echo [7] Days to weeks
echo [8] Weeks to days
echo [quit] Exit the converter
set /p var=^>
cls
if "%var%"=="1" goto m2s
if "%var%"=="2" goto s2m
if "%var%"=="3" goto m2h
if "%var%"=="4" goto h2m
if "%var%"=="5" goto d2h
if "%var%"=="6" goto h2d
if "%var%"=="7" goto d2w
if "%var%"=="8" goto w2d
if /i "%var%"=="quit" goto extramenu
goto timeconverter
REM Formula rewritten!
REM ----- From this:
REM :calculate
REM if %ap0% GEQ 60 ( set /a apr0=%apr0%+1) & set /a ap0=%ap0%-60
REM if %ap0% LSS 60 ( set /a apr1=%apr1%+%ap0%) & goto finish
REM goto calculate
REM ----- To This:
REM set /a int=%ap0%/60
REM set /a dec=%ap0%-%int%*60
REM ++ Simpler code, no GOTO loops -> Instant result!
:m2s
set ap0=null
set ap1=null
echo Minutes to seconds
echo (Type nothing to exit)
set /p ap0=1/2 Enter minutes: 
set /p ap1=2/2 Enter seconds: 
if %ap0%==null goto timeconverter
echo.
if %ap0% GTR 35791394 ( echo Time exceeds 2147483647 seconds.) & ( echo.) & goto m2s
set /a apr0=%ap0%*60
set /a apr0=%apr0%+%ap1%
echo Time is %apr0% seconds.
echo.
goto m2s

:s2m
set ap0=null
echo Seconds to minutes
echo (Type nothing to exit)
set /p ap0=Enter seconds: 
if %ap0%==null goto timeconverter
echo.
set /a int=%ap0%/60
set /a dec=%ap0%-%int%*60
echo Time is %int% minutes %dec% seconds.
echo.
goto s2m

:m2h
set ap0=null
echo Minutes to hours
echo (Type nothing to exit)
set /p ap0=Enter minutes: 
if %ap0%==null goto timeconverter
echo.
set /a int=%ap0%/60
set /a dec=%ap0%-%int%*60
echo Time is %int% hours %dec% minutes.
echo.
goto m2h

:d2h
set ap0=null
echo Days to hours
echo (Type nothing to exit)
set /p ap0=Enter days: 
if %ap0%==null goto timeconverter
echo.
if %ap0% GTR 89478485 ( echo Time exceeds 2147483647 hours.) & ( echo.) & goto d2h
set /a apr0=%ap0%*24
echo Time is %apr0% hours.
echo.
goto d2h

:h2m
set ap0=null
set ap1=null
echo Hours to minutes
echo (Type nothing to exit)
set /p ap0=1/2 Enter hours: 
set /p ap1=2/2 Enter minutes: 
if %ap0%==null goto timeconverter
echo.
set /a apr0=%ap0%*60
set /a apr0=%apr0%+%ap1%
echo Time is %apr0% minutes.
echo.
goto h2m

:h2d
set ap0=null
echo Hours to days
echo (Type nothing to exit)
set /p ap0=Enter hours: 
if /i %ap0%==null goto timeconverter
echo.
set /a int=%ap0%/24
set /a dec=%ap0%-%int%*24
echo Time is %int% days %dec% hours.
echo.
goto h2d

:w2d
set ap0=null
echo Week to days
echo (Type nothing to exit)
set /p ap0=Enter weeks: 
if /i %ap0%==null goto timeconverter
echo.
if %ap0% GTR 306783378 ( echo Time exceeds 2147483647 days) & ( echo.) & goto w2d
set /a apr0=%ap0%*7
echo Time is %apr0% days.
echo.
goto w2d

:d2w
set ap0=null
echo Days to weeks
echo (Type nothing to exit)
set /p ap0=Enter days: 
if /i %ap0%==null goto timeconverter
echo.
set /a int=%ap0%/7
set /a dec=%ap0%-%int%*7
echo Time is %int% weeks %dec% days.
echo.
goto d2w

:minigameintro
REM Is CHOICE installed?
REM highscore check
set newscore=no
color 0B
if not exist hi-score.cmd echo set /a scorehi=0 1>hi-score.cmd
if not exist hi-score-choice.cmd echo set /a scorehi=0 1>hi-score-choice.cmd
if "%quizhigh%"=="" set quizhigh=0
:minigameintro0
set var=BUGFIX
cls
echo ==== Cirno Training ==== V1.06 ==== Original By: Chibitami ====
echo.
echo Welcome to Cirno Training! This minigame was created by Cirno. (Isn't it?)
echo You will be presented with a simple math additions. However, all you have
echo to do unlike ANY other minigames is that you must pick the WRONG answers!
echo However, if it adds up to 9, answer it correctly.
if %nochoice%==no echo You have only 3 seconds to answer each question incorrectly!
if %nochoice%==yes (
	echo.
	echo Because you're using Windows XP, CHOICE is not included. Install CHOICE by
	echo downloading the Resource Kit 2003 or 2000, then copy choice.exe and put it to
	echo My Documents folder. Without CHOICE, this minigame cannot have a time limit.
	echo Note: Separate choice.exe download may not works. Good luck making it work.)
echo.
ping localhost -n 2 >nul
echo Do you want to play the minigame and become Cirno now? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto miniready
if /i "%var%"=="n" goto minidirchangeback
goto minigameintro
:miniready
set readytimer=6
set score=0
set quiz=0
goto miniready0
:miniready0
cls
set /a readytimer-=1
if %readytimer%==1 set /a readytimer=9
if %readytimer%==8 goto at0
echo ==== Cirno Training ====
echo Ready? %readytimer%...
echo.
echo [Controls]
echo a - Choose left
echo d - Choose right
ping localhost -n 2 >nul
goto miniready0
:at0
set /a aa=%random%/4096+1
set /a ab=%random%/4096+1
:at1
set /a ac=%random%/4096+1
set /a ad=%random%/4096+1
set /a af=%aa%+%ab%
if %af% GTR 9 goto at0
set /a ba=%random%/16384
if %ba%==0 set /a ac=%aa%+%ab%
if %ba%==1 set /a ad=%aa%+%ab%
if %ac%==%ad% goto at1
set /a quiz+=1
if %quiz% GTR 1 goto minimain
goto minimain0
:minimain0
echo ==== Cirno Training ====
echo Game Start!
set /a score=0
:minimain
set ans=BUGFIX
echo  Question %quiz%.
echo   %aa% Plus %ab%
echo      (%ac%) or (%ad%)
echo Cirno score: %score% Pts.
if %nochoice%==yes goto minimain0xp
if %quiz% LSS 40 choice /t 3 /c adp /d p >nul
if %quiz% GEQ 40 choice /t 2 /c adp /d p >nul
if errorlevel 3 goto miniover
if errorlevel 2 goto minicalb
if errorlevel 1 goto minicalb
:minimain0xp
set /p ans=^>
if /i "%ans%"=="a" goto minicala
if /i "%ans%"=="d" goto minicala
if "%ans%"=="end" goto minidirchangeback
:miniinvaild
cls
echo ==== Cirno Training ====
echo Invaild choice!
echo Press "a" to choose left answer.
echo Press "d" to choose right answer.
goto minimain
:minicala
if /i "%ans%"=="a" set /a ansp=%ac%
if /i "%ans%"=="d" set /a ansp=%ad%
if %af%==9 goto minical9
goto minical0
:minicalb
if errorlevel 1 set /a ansp=%ac%
if errorlevel 2 set /a ansp=%ad%
if %af%==9 goto minical9
goto minical0
:minical0
if %af%==%ansp% goto miniover
goto minicorrect
:minical9
if %ansp%==9 goto minicorrect
goto miniover
:minicorrect
cls
echo ==== Cirno Training ====
echo That's Right!
if %af%==9 set /a score+=1
set /a score+=3
goto at0
:miniover
set /a quizlast=%quiz%-1
if %nochoice%==no call hi-score.cmd
if %nochoice%==yes call hi-score-choice.cmd
if %score% GTR %scorehi% set newscore=yes
if %nochoice%==no if %score% GTR %scorehi% echo set /a scorehi=%score% 1>hi-score.cmd
if %nochoice%==yes if %score% GTR %scorehi% echo set /a scorehi=%score% 1>hi-score-choice.cmd
:miniover0
cls
if %nochoice%==no call hi-score.cmd
if %nochoice%==yes call hi-score-choice.cmd
set var=BUGFIX
echo ==== Cirno Training ====
if %newscore%==yes ( echo New Hi-Score!: %scorehi% Pts.) else ( echo Game Over.)
echo.
echo Total Cirno score: %score% Pts.
echo You have answered %quizlast% questions like Cirno.
echo Hi-Score: %scorehi% Pts.
set newscore=no
if %nochoice%==yes echo [CHOICE not installed, no time limit.]
echo.
echo Play again? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto miniready
if /i "%var%"=="n" goto minidirchangeback
goto miniover0
:minidirchangeback
color %fi2%%fi1%
goto play
:faq
cls
echo ==== Frequently Asked Questions ====
echo.
echo 1. How did you name your game?
echo    A. The name came up from my mind when I was writing the game concept.
echo       The observer is the camera, but it is blind, so text is used instead.
echo.
echo 2. Is there a random change of weird glitches appearing anytime?
echo    A. No, if I make mistakes in coding, there'll be just bugs, no glitches.
echo.
echo 3. Where can I find the source code of this game?
echo    A. Right click this game file and then click Edit.
echo.
echo 4. Why don't make it clear the screen each time the command is used?
echo    A. Most real DOS Text Adventures games don't clear the screen per command.
echo       If you want that, there is a boolean option for this on main menu.
echo.
echo 5. Could you add some graphics please, like ASCII graphics.
echo    A. It use so much time to create the real ASCII graphics and it's too
echo       difficult for me. At least I can create you some ASCII arts.
echo.
echo 6. Why does the last digit of Hi-Score at the main menu is O not 0?
echo    A. It's the least obvious way to tell that you have an internet connection.
echo       "0" means you have it and "O" means you didn't have.
pause>nul
goto play
:intro
REM Beta V1.2.6 Update!
cls
set var0=BUGFIX
set var=BUGFIX
echo === Start a New Game ====
echo.
echo Difficulty
echo [1] Easy
echo [2] Normal
echo [3] Hard
echo [4] Lunatic
set /p var0=^>
if "%var0%"=="1" goto warnelementarykids
if "%var0%"=="2" goto intro0
if "%var0%"=="3" ( echo.
	echo That's a good choice for you. Good Luck!
	echo.
	pause
	goto intro0)
if "%var0%"=="4" goto warnjapaneseplayers
if "%var0%"=="BUGFIX" goto play
goto intro

:warnelementarykids
echo.
echo Eehhh maji? Easy Modo?! That's only for elementary kids!
echo Are you sure you absolutely needed to play on Easy Mode? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto warnelementarykids0
if /i "%var%"=="n" goto intro
goto intro
:warnelementarykids0
set var=BUGFIX
echo.
echo Someone may tease you for playing on Easy Mode! Don't play on Easy? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto intro
if /i "%var%"=="n" goto intro0
goto intro

:warnjapaneseplayers
echo.
echo Don't underestimate Lunatic Mode! Are you sure to play on Lunatic? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto intro0
if /i "%var%"=="n" goto intro
goto intro
:intro0
REM ========== START OF THE MAIN GAME ==========::
if %loadmode%==0 (
	cls
	echo You are Marisa Kirisame. Your duty is to find a good mushroom.
	echo You are inconsiderate and lacking manners, but generally straightforward.
	set /a diff=%var0%-1)
if %diff%==0 set difffact=3/4
if %diff%==1 set difffact=1
if %diff%==2 set difffact=4/3
if %diff%==3 set difffact=8/5
REM 0.75
REM 1
REM 1.33
REM 1.60
set stat0=0
set stat0a=0
set stat0b=0
set stat1=0
set stat2=12
set stat3=0
set stat4=0
set stat5=4
set /a stat5int=%stat5%+14
set stat6=90
set stat6a=90
set stat7=0
set stat8=1
set stat9=0
set stat10=0
set stat11=0
set stat12=0
set stat13=0
set stat14=0
set stat15=50
set stat16=0
REM stat0 = mushrooms
REM stat0a= mushrooms all
REM stat0b= mushrooms search
REM stat1 = sold mushrooms
REM stat2 = money
REM stat3 = money donated
REM stat4 = mokou helped
REM stat5 = more atk level
REM stat5int = preset attack damage
REM stat6 = your hp
REM stat6a= your max hp
REM stat7 = your exp
REM stat8 = your level
REM stat9 = your defense (from donation/10)
REM stat10 = your potions left
REM stat11 = your BAC D:
REM stat12 = your score
REM stat13 = /AIR/
REM stat14 = Seaweed (in grams)
REM stat15 = Speed (Battle)
REM stat16 = if 0, No Tea - if 1, Tea
set /a hp4=%stat6a%*9/10
set /a hp3=%stat6a%*6/10
set /a hp2=%stat6a%*4/10
set /a hp1=%stat6a%*2/10
set /a hp0=%stat6a%*1/10
REM hp4 is 90 to 100 excellent
REM hp3 is 60 to 90 fine
REM hp2 is 40 to 60 not well
REM hp1 is 20 to 40 Poor
REM hp0 is 10 to 20 tiring
REM below = 0 to 10 nearly exhausted
set /a blood=3960-(%random%/1024)
set blooda=3940
set defeat=0
set mspark=0
set turnall=0
set turnadd=0
REM Marisa's blood volume declared as 3.94 litres
REM on real calculation. Assumed 61 kg, 170 cm.
REM Blood loss of 40% is considered as 0 continues.
REM 2340 is 40% loss.
set shanghaidefeats=0
REM Beta 1.3.3 Changes: After having to see A5SA551N CREED
REM The better thing would be about the synch...
set found0=no
set found1=no
REM set found2=no
REM set found3=no
set /a mony=%random%/2048+24
set abb0=1
set abb1=1
REM abb0, abb1 Used in reconsider
set notice=no
set started=yes
if %loadmode%==0 call :gCOMMANDHELP
if %loadmode%==1 goto :eof
if /i "%var%"=="power level is over 9000!" goto introcheat1
goto marisainside
:introcheat1
set stat6=9001
set stat6a=9001
set stat7=1337
goto marisainside
:leveling
REM This is a subroutine, after winning a battle.
set stat8last=%stat8%
set stat5intlast=%stat5int%
set stat6alast=%stat6a%
set stat15last=%stat15%
if %stat7% LSS 20 ( set stat8=1) & goto leveling0
if %stat7% LSS 40 ( set stat8=2) & goto leveling0
if %stat7% LSS 90 ( set stat8=3) & goto leveling0
if %stat7% LSS 160 ( set stat8=4) & goto leveling0
if %stat7% LSS 250 ( set stat8=5) & goto leveling0
if %stat7% LSS 360 ( set stat8=6) & goto leveling0
if %stat7% LSS 490 ( set stat8=7) & goto leveling0
if %stat7% LSS 640 ( set stat8=8) & goto leveling0
if %stat7% LSS 810 ( set stat8=9) & goto leveling0
if %stat7% LSS 1000 ( set stat8=10) & goto leveling0
if %stat7% LSS 1210 ( set stat8=11) & goto leveling0
if %stat7% LSS 1440 ( set stat8=12) & goto leveling0
if %stat7% LSS 1670 ( set stat8=13) & goto leveling0
if %stat7% LSS 1960 ( set stat8=14) & goto leveling0
if %stat7% LSS 2250 ( set stat8=15) & goto leveling0
if %stat7% LSS 2560 ( set stat8=16) & goto leveling0

:leveling0
if %stat8%==2 ( set stat5=5) & ( set stat6a=95) & set stat15=100
if %stat8%==3 ( set stat5=6) & ( set stat6a=100) & set stat15=150
if %stat8%==4 ( set stat5=7) & ( set stat6a=110) & set stat15=200
if %stat8%==5 ( set stat5=8) & ( set stat6a=120) & set stat15=240
if %stat8%==6 ( set stat5=9) & ( set stat6a=130) & set stat15=280
if %stat8%==7 ( set stat5=10) & ( set stat6a=140) & set stat15=320
if %stat8%==8 ( set stat5=11) & ( set stat6a=150) & set stat15=360
if %stat8%==9 ( set stat5=12) & ( set stat6a=165) & set stat15=400
if %stat8%==10 ( set stat5=13) & ( set stat6a=180) & set stat15=425
if %stat8%==11 ( set stat5=14) & ( set stat6a=195) & set stat15=450
if %stat8%==12 ( set stat5=15) & ( set stat6a=210) & set stat15=475
if %stat8%==13 ( set stat5=16) & ( set stat6a=225) & set stat15=500
if %stat8%==14 ( set stat5=17) & ( set stat6a=240) & set stat15=520
if %stat8%==15 ( set stat5=18) & ( set stat6a=260) & set stat15=540
if %stat8%==16 ( set stat5=19) & ( set stat6a=280) & set stat15=560


REM Health level needs to update...
set /a hp4=%stat6a%*9/10
set /a hp3=%stat6a%*6/10
set /a hp2=%stat6a%*4/10
set /a hp1=%stat6a%*2/10
set /a hp0=%stat6a%*1/10
set /a stat5int=%stat5%+14
if %stat8last% LSS %stat8% goto levelupped
goto :eof
:levelupped
set /a stat12int=(%stat8%+10)*250
set /a stat12+=%stat12int%
set /a stat6=%stat6a%-%stat6alast%+%stat6%
echo.
echo ==============================
echo /Level Up!/  %stat8last% -^> %stat8%
echo HP:  %stat6alast% -^> %stat6a%
echo ATK: %stat5intlast% -^> %stat5int% [+/- 4] 
echo SPD: %stat15last% -^> %stat15%
echo ==============================
if %stat8%==5 ( echo - You can now go to the
	echo Netherworld at your house!
	echo ==============================)
goto :eof
:CHOICEMENU
REM The most important subroutine of ALL!
if "%nulcom%"=="no" set /a turnall-=10
set nulcom=no
set /a turnall=%turnall%+10+%turnadd%
REM Here goes the turn based events.
set turnadd=0

call :SCORESP
set /p var=^>
if "%faqopt0%"=="n" cls
REM echo Global commands goes here.
if /i "%var%"=="stat" goto gSHORTSTATUS
if /i "%var%"=="stats" goto gSHORTSTATUS
if /i "%var%"=="status" goto gSHORTSTATUS
if /i "%var%"=="statuses" goto gSHORTSTATUS
if /i "%var%"=="i" goto gINVENTORY
if /i "%var%"=="inv" goto gINVENTORY
if /i "%var%"=="inventory" goto gINVENTORY
if /i "%var%"=="heal" goto gHEAL
if /i "%var%"=="drink" goto gTEATIME
if /i "%var%"=="save" goto quitsave
if /i "%var%"=="load" goto gameloadmenu
if /i "%var%"=="restore" goto gameloadmenu
if /i "%var%"=="wait" goto gWAITING
if /i "%var%"=="quit" goto quit
if /i "%var%"=="exit" goto quit
if /i "%var%"=="end" goto quit
if /i "%var%"=="help" goto gCOMMANDHELP
if /i "%var%"=="menu" goto play

if /i "%var%"=="xyzzy" goto gOLDCHEAT
if /i "%var%"=="undo" goto gFAILCHEAT
if /i "%var%"=="lol" goto gLOLANSWER
if /i "%var%"=="42" goto gEVERYTHING
if /i "%var%"=="wtf" goto gWHATDAF
if /i "%var%"=="wtf?" goto gWHATDAF
if /i "%var%"=="wtf!" goto gWHATDAF
if /i "%var%"=="wtf!?" goto gWHATDAF
if /i "%var%"=="wtf?!" goto gWHATDAF
if /i "%var%"=="wtf??" goto gWHATDAF
if /i "%var%"=="wtf!!" goto gWHATDAF
if /i "%var%"=="4 8 15 16 23 42" goto gLOSTNUM
if /i "%var%"=="cls" goto gCLS
set nulcom=yes
goto :eof
:SCORESP
set stat12sp=00000000
if %stat12% GEQ 100 set stat12sp=000000
if %stat12% GEQ 1000 set stat12sp=00000
if %stat12% GEQ 10000 set stat12sp=0000
if %stat12% GEQ 100000 set stat12sp=000
if %stat12% GEQ 1000000 set stat12sp=00
if %stat12% GEQ 10000000 set stat12sp=0
if %stat12% GEQ 100000000 set stat12sp=
if %stat12% GTR %stat12hi% echo set /a stat12hi=%stat12% >main-high.cmd
call main-high.cmd
set stat12hisp=00000000
if %stat12hi% GEQ 100 set stat12hisp=000000
if %stat12hi% GEQ 1000 set stat12hisp=00000
if %stat12hi% GEQ 10000 set stat12hisp=0000
if %stat12hi% GEQ 100000 set stat12hisp=000
if %stat12hi% GEQ 1000000 set stat12hisp=00
if %stat12hi% GEQ 10000000 set stat12hisp=0
if %stat12hi% GEQ 100000000 set stat12hisp=
goto :eof
:gSHORTSTATUS
if %diff%==0 set diffinfo=Easy Mode
if %diff%==1 set diffinfo=Normal
if %diff%==2 set diffinfo=Hard
if %diff%==3 set diffinfo=Lunatic
echo.
echo ==== Quick status ==== Difficulty: %diffinfo%
echo HP:  %stat6%/%stat6a%	 ATK: %stat5int% +/- 4				Score  %stat12sp%%stat12%
echo DEF: %stat9%  	 EXP: %stat7% 			     Hi-Score  %stat12hisp%%stat12hi%
echo SPD: %stat15%  	 Level: %stat8%	 
echo Turns spant: %turnall%
goto :eof
:gINVENTORY
echo.
echo ==== Inventory ====
echo You have:
if %stat16%==0 echo no tea
if %stat16%==1 echo Tea
if %stat2% GTR 0 echo %stat2% Yens
if %stat0% GTR 0 echo %stat0% Mushrooms
if %stat14% GTR 0 echo %stat14% grams of Seaweed
if %stat10% GTR 0 echo %stat10% Healing Potions
goto :eof
:gCOMMANDHELP
echo.
echo ==== Global Commands ==== Alternate names are available
echo [help] In case you forget these commands.
echo [wait] Spend the time waiting.
echo [stat] View a quick status.
echo [inv]  View your inventory.
echo [heal] Drink healing potion. (if you have one.)
echo [drink] Drink the tea. (if you have one.)
echo [save] Save current game.
echo [load] Load game from the save.
echo [menu] Back to main menu.
echo [quit] Quit the game, prompt for saving.
goto :eof
:gHEAL
if %stat10%==0 goto gHEAL0
set /a stat10-=1
set /a stat6+=60
set turnadd+=5
if %stat6% GTR %stat6a% set stat6=%stat6a%
echo.
echo You healed 60 HP by drinking a Potion. You HP is now %stat6%/%stat6a%.
goto :eof
:gHEAL0
echo.
echo You need a healing potion to heal your HP!
goto :eof
:gOLDCHEAT
echo.
echo That's a nice command you typed there. It would be a shame if nothing happened.
goto :eof
:gFAILCHEAT
echo.
echo It's not worth it to implement this action, it's a cheat.
echo And the game creator can't even code this one... yet.
goto :eof
:gEVERYTHING
echo.
echo That's the answer to life, Youkai, Kappa, Tengu, Rabbit, Vampires,
echo Onis, Yukkuris, The Creator, Japan, universe, and Everything else.
goto :eof
:gLOLANSWER
echo.
set /a non0=%random%/4096
if %non0%==0 echo lolwut?
if %non0%==1 echo lololol
if %non0%==2 echo Trolololo
if %non0%==3 echo wwwwwwww
if %non0%==4 echo That was great!
if %non0%==5 echo That was funny indeed!
if %non0%==6 echo :D
if %non0%==7 echo ^^_^^
goto :eof
:gWHATDAF
echo.
set /a non0=%random%/4096
if %non0%==0 echo Aww, that sucks. D:
if %non0%==1 echo I'm sorry for that.
if %non0%==2 echo Don't let your hope down.
if %non0%==3 echo I see, that sucks.
if %non0%==4 echo Sucks to be you D:
if %non0%==5 echo That was a shame...
if %non0%==6 echo It doesn't look that bad.
if %non0%==7 echo Don't worry if you've saved your game.
goto :eof
:gLOSTNUM
echo.
echo It does nothing! (A certain countdown counter didn't reach 4:00 Yet!)
goto :eof
:gCLS
cls
goto :eof
:gWAITING
set turnadd=30
ping localhost -n 2 >nul
echo.
echo You have waited. Time passes.
goto :eof
:gTEATIME
if %stat16%==0 goto gTEATIME0
set stat16=0
set /a blood=(%blooda%-%blood%)/4+%blood%
set /a stat6+=30
if %stat6% GTR %stat6a% set stat6=%stat6a%
echo.
echo You drank the tea! Your blood volume has increased by 25%% toward maximum!
echo You also healed 30 HP!
goto :eof
:gTEATIME0
echo.
echo LMAO, drinking the no tea? It will never makes sense though...
goto :eof
:noncommand
echo.
set /a non0=%random%/4096
if %non0%==0 echo That's not an option, -daze!
if %non0%==1 echo What, that option isn't in the list!
if %non0%==2 echo Choose the number in bracket, -daze!
if %non0%==3 echo Ehh? Nope, a choice that doesn't exist...?
if %non0%==4 echo What else would I do then?
if %non0%==5 echo That's not an option as it seem, -daze!
if %non0%==6 echo I don't know anymore choices...
if %non0%==7 echo That's an non-existant option, -daze!
set turnadd=-10
goto :eof
:status
REM Erin typo is intentional :/
if %stat6% LSS %hp0% ( set stat6msg=Nearly Exhausted!) & set stat6msg0=HELP ME, ERINNNNN!!
if %stat6% GEQ %hp0% ( set stat6msg=Tiring) & set stat6msg0=Help, Eirin! Cure me!
if %stat6% GEQ %hp1% ( set stat6msg=Poor) & set stat6msg0=Wanna let Eirin to cure me!
if %stat6% GEQ %hp2% ( set stat6msg=Not well) & set stat6msg0=Time to visit Eirin for now.
if %stat6% GEQ %hp3% ( set stat6msg=Fine) & set stat6msg0=
if %stat6% GEQ %hp4% set stat6msg=Awesome!
echo.
echo Today's date: %date%
echo ==== My status notebook ====
echo (I'll write more statuses here.)
echo Mushroom stats:
echo Collected; %stat0a%   Searched; %stat0b% times
if %stat1% NEQ 0 echo Sold; %stat1%   Left; %stat0% 
echo ------------------------------
if %stat2% NEQ 0 echo Money left: %stat2% Yens, donated %stat3% Yens.
set /a stat5int=%stat5%+14
echo Attack Power: Around %stat5int% [+/- 4]
if %stat9% NEQ 0 echo Defense: %stat9% [10 Yens donated = 1]
if %stat7% NEQ 0 echo Experience: %stat7% EXP, Level %stat8%
if %defeat% NEQ 0 echo Defeated: %defeat% times. (^>_^<)
echo Health Status: %stat6msg% [%stat6%/%stat6a% HP]
if %stat6% LSS %hp3% echo - %stat6msg0%
:marisainside
set lastplace=:marisainside
echo.
set var=BUGFIX
if "%notice%"=="yes" ( echo [Control has been switched to Marisa.]) & echo.
set notice=no
set misc0=no
echo Inside Marisa's House
echo You are inside your house.
echo.
echo What do you want to do?
echo [1] Go outside of your house.
echo [2] Read the leaflet.
echo [3] View your status notebook.
echo [4] Measure your body statuses.
if /i %found1%==yes echo [fun] Do a breath hold.

call :CHOICEMENU
if "%var%"=="1" goto marisahouse
if "%var%"=="2" goto marisabook
if "%var%"=="3" goto status
if "%var%"=="4" goto measureblood
if /i "%var%"=="I wanna be Nitori" if /i %found1%==no ( set found1=yes) & goto marisainside
if /i "%var%"=="fun" if /i %found1%==yes goto marisabreathhold
if /i "%var%"=="read leaflet" goto marisabook
if %nulcom%==yes call :noncommand
goto marisainside

:measureblood
echo.
echo Measuring . . .
ping localhost -n 3 >nul
set /a bloodlossadd=(%blooda%-%blood%)/10
set /a bloodloss=99-(%bloodlossadd%*%bloodlossadd%*%bloodlossadd%)/40000
set stat11zeros=0
if %stat11% GEQ 10 set stat11zeros=
set /a bloodint=(%blood%/1000)
set /a blooddec=(%blood%-%bloodint%000)/10
set blood0=0
if %blooddec% GEQ 10 set blood0=
REM Max is 3940 ml.
echo.
echo Your blood volume is %bloodint%.%blood0%%blooddec% liters.
if %stat11% GEQ 1 echo Also, your BAC is 0.%stat11zeros%%stat11%%%
echo %bloodloss%%% Synch
goto marisainside
:marisabreathhold
echo.
set notice=yes
echo [Control has been switched to Player.]
:marisabreathhold0
set var=BUGFIX
echo.
echo There you go, player :] You did really wish Marisa could beat Nitori.
echo Here is your chance to let Marisa to do the "Training" for her best!
REM What training means in this case, it is "Training Exercise" fad on Nico Video :DD
echo.
echo What do you want Marisa to do?
echo [1] Breath hold above water.
echo [2] Breath hold in a bathtub.
echo [end] Back to adventures.
set /p var=^>
if "%var%"=="1" goto marisabreathholddry
if "%var%"=="2" goto marisabreathholdwet
if /i "%var%"=="end" goto marisainside
echo.
echo The choice you entered does not exist here.
goto marisabreathhold0

:breath

REM A CODE TO CLEAN THEM ALL!
REM This is an awesome code clean up!
REM Rewriting the code is much better!

REM Params - :breath avgtime-Secs drownchance-Normal=512
REM if drownchance=0 -> none
REM ALL units are in seconds
set /a br0=%1
REM A constant
if %stat6% LSS %hp0% set br1=1/4
if %stat6% GEQ %hp0% set br1=1/3
if %stat6% GEQ %hp1% set br1=1/2
if %stat6% GEQ %hp2% set br1=2/3
if %stat6% GEQ %hp3% set br1=3/4
if %stat6% GEQ %hp4% set br1=1
if %stat6%==%stat6a% set br1=11/10
REM Divide all
if %stat6% LSS %hp0% set br5=24
if %stat6% GEQ %hp0% set br5=16
if %stat6% GEQ %hp1% set br5=10
if %stat6% GEQ %hp2% set br5=5
if %stat6% GEQ %hp3% set br5=2
if %stat6% GEQ %hp4% set br5=0
REM Drowning chance, water only!

set /a br2=%stat13%
REM Constant skill
set /a br3=%stat8%*2
REM Level increases it
set /a br4=%random%/512-40
REM The randomness
set /a br6=%2
REM Drowning chance constant!

set /a brfinal=(%br0%+%br2%+%br3%+%br4%)*%br1%
set /a brwait=%brfinal%/30+2
if not "%3"=="false" ping localhost -n %brwait% >nul

set /a int=%brfinal%/60
set /a dec=%brfinal%-%int%*60
if %dec% LSS 10 set dec0=0
if %dec% GEQ 10 set dec0=
REM You don't need to calculate this outside this subroutine.

if not %br6%==0 set /a br7=%random%/%br6%
REM if %br5% GTR %br7% Then you can put drowning damage after this.
REM Minutes and Seconds outputs in int and dec
goto :eof

:marisabreathholddry
echo.
echo Condition: %stat6%/%stat6a% HP
echo Laying down . . .
ping localhost -n 2 >nul
echo Preparing . . .
ping localhost -n 3 >nul
echo Marisa started her breath hold :]
call :breath 180 0
set /a stat13=%int%/2+stat13
if %stat13% GTR 70 set mari3=70
echo.
echo She does %int%:%dec0%%dec% minutes. :D
if %int% GEQ 1 echo Her breathholding skill is now %stat13%!
goto marisabreathhold0

:marisabreathholdwet
echo.
echo Condition: %stat6%/%stat6a% HP
if %misc0%==no echo Filling water . . .
if %misc0%==no ping localhost -n 5 >nul
echo Laying down . . .
ping localhost -n 2 >nul
echo Preparing . . .
ping localhost -n 4 >nul
echo Marisa started her breath hold :]
call :breath 135 256
if %br5% LEQ %br7% set /a stat13=%int%+stat13
if %br5% GTR %br7% set /a stat6=(%random%/-16384)+stat6-1
if %stat13% GTR 70 set mari3=70
echo.
echo She does %int%:%dec0%%dec% minutes. :D
if %br5% LEQ %br7% echo Her breathholding skill is now %stat13%!
if %br5% GTR %br7% if %stat6% GEQ 1 ( echo But, awwwwww, she inhaled water! Marisa now have %stat6%/%stat6a% HP. :[)
if %br5% GTR %br7% if %stat6% LSS 1 (
	echo But, OH MY GOD!!!! MARISA DROWNED!! D:
	ping localhost -n 4 >nul
	goto defeatX)
goto marisabreathhold0

:marisahouse
set lastplace=:marisahouse
echo.
set var=BUGFIX
echo Marisa's house
echo You are at your house. Alice is your neighbor.
echo.
echo What do you want to do?
echo [1] Go to the forest.
echo [2] Go to Alice's house.
echo [3] Enter your house.
if %stat8% GEQ 5 echo [4] Go up to the Netherworld.
call :CHOICEMENU
if "%var%"=="1" goto forest
if "%var%"=="2" goto alicehouse
if "%var%"=="3" goto marisainside
if %stat8% GEQ 5 if "%var%"=="4" goto netherworldentrypre
if /i "%var%"=="flashforward" goto marisaflashforward
if /i "%var%"=="future" goto marisaflashforward
if /i "%var%"=="marisa dies" goto marisaflashforward
if %nulcom%==yes call :noncommand
goto marisahouse
:marisaflashforward
REM Ha, for the lulz.
if %hasnet%==1 start www.youtube.com/watch?v=ADE3b3mOXZw#t=3m40s
ping localhost -n 51 >nul
goto defeatX
:forest
set lastplace=:forest
:forestfoes
set /a foe=%random%/256
if %foe% GTR 40 goto forestfoes
if %foe% LEQ 5 goto foe
if %foe% LEQ 10 goto Rumia
:forestmenu
echo.
set var=BUGFIX
echo Forest of Magic
echo You are in the forest.
echo.
echo What do you want to do?
echo [1] Find the mushroom.
echo [2] Go to your house.
echo [3] Go to Alice's House.
echo [4] Go to a path to Hakurei Shrine.
echo [5] Go to Bamboo forest.
echo [6] Go to Kourindou.
call :CHOICEMENU
if "%var%"=="1" goto forestfind
if "%var%"=="2" goto marisahouse
if "%var%"=="3" goto alicehouse
if "%var%"=="4" goto pathtoshrine
if "%var%"=="5" goto bamboo
if "%var%"=="6" goto kourindou
if %nulcom%==yes call :noncommand
goto forestmenu
:forestfind
set /a turnadd+=10
set /a stat0b=%stat0b%+1
if "%faqopt0%"=="n" cls
echo.
echo You are finding the mushroom . . .
ping localhost -n 2 >nul
:forestfind0
set /a foe=%random%/256
if %foe% GTR 40 goto forestfind0
if %foe% LEQ 8 goto foe
if %foe% LEQ 12 goto Rumia
if %foe% GEQ 36 if %stat8% GEQ 3 goto forestsmallpathfound
:forestfind1
set /a num=%random%/256
if %num% GTR 100 goto forestfind1
if %num% LSS 40 goto forestfound
goto forestfail
:forestfail
echo You couldn't find them.
if %foe% LEQ 20 echo You are likely to be eaten by a rumia.
goto forestretry
:forestretry
echo.
set var=BUGFIX
echo What do you want to do?
echo [1] Give up finding.
echo [2] Continue finding.
set /p var=^>
if "%var%"=="1" goto forest
if "%var%"=="2" goto forestfind
echo.
echo That's not an option -daze!
goto forestretry
:forestfound
set /a stat0=%stat0%+1
set /a stat0a=%stat0a%+1
set /a stat12+=3000
call :SCORESP
echo 							Score  %stat12sp%%stat12%
echo You found it! Now you have %stat0% mushrooms. 	     Hi-Score  %stat12hisp%%stat12hi%
goto forest
:forestsmallpathfound
echo.
set var=BUGFIX
echo When you were finding the mushroom, you found a small path.
if %found0%==no echo You have never seen this path before, perhaps something secret?
if %found0%==yes echo It's a path to Road of Reconsideration. You should not go there again!
echo.
echo What do you want to do?
echo [1] Give up finding mushroom.
echo [2] Continue finding mushroom.
echo [3] Follow the path.
set /p var=^>
if "%var%"=="1" goto forest
if "%var%"=="2" goto forestfind
if "%var%"=="3" goto forestsmallpath
if %nulcom%==yes ( echo.) & echo That's not an option -daze!
goto forestsmallpathfound
:forestsmallpath
set lastplace=:forestsmallpath
echo.
set var=BUGFIX
echo Small path in Forest of Magic
echo You are now following the small path in the forest.
if %found0%==no echo You don't know what this path in the forest leads you to.
if %found0%==yes echo This path will leads you to Road of Reconsideration.
echo.
echo What do you want to do?
echo [1] Keep following the path.
echo [2] Go out of the path.
call :CHOICEMENU
if "%var%"=="1" goto forestsmallpathd
if "%var%"=="2" goto forest
if %nulcom%==yes call :noncommand
goto forestsmallpathd
:forestsmallpathd
set /a dist=%dist%+1
if %dist%==2 ( set dist=0) & goto reconsiderroad
goto forestsmallpath
:reconsiderroad
echo.
set found0=yes
set var=BUGFIX
echo Road of Reconsideration
echo Going along the Road of Reconsideration... It leads to Muenzuka.
echo [Phase %abb0%/3... Attempt %abb1%/5]
echo.
echo Reconsider or just keep walking?
echo [1] Reconsider...!
echo [2] Just keep going!
if %abb0%==3 echo [3] Go to road of Liminality now!
set /p var=^>
if "%var%"=="1" goto reconsiderroadretire
if "%var%"=="2" goto reconsiderroadwalk
if %abb0%==3 if "%var%"=="3" goto roadtoriver
echo.
echo That's... not an option! You may just reconsider that.
goto reconsiderroad
:reconsiderroadretire
echo.
set abb0=1
set abb1=1
echo You reconsidered your decision, you quickly went back to the forest.
goto forest
:reconsiderroadwalk
set num=%random%
if %num% GTR 3000 goto reconsiderroadwalk
ping localhost -n 2 >nul
if %num% LSS 1200 goto reconsiderroadwalkok
:reconsiderroadwalkfail
set /a abb1=%abb1%+1
echo.
echo "I... couldn't... go!"
if %abb1%==6 goto reconsiderroadretire
goto reconsiderroad 
:reconsiderroadwalkok
set /a abb0=%abb0%+1
echo.
echo You could.
if %abb0%==4 ( set abb0=1) & goto MUENZUKA
set abb1=1
goto reconsiderroad
:MUENZUKA
set lastplace=:MUENZUKA
echo.
set abb0=1
set abb1=1
set var=BUGFIX
echo Muenzuka
echo You are at Muenzuka. It is the graveyard of humans who don't have relatives.
echo It is also the home of a purple cherry blossom tree.
echo 3 borders that coexists are Gensokyo, outside world, and realms of the dead.
echo.
echo What... do you want... to do?
echo [1] Go back to Forest of Magic.
echo [2] GO TO OUR OUTSIDE WORLD!
call :CHOICEMENU
if "%var%"=="1" goto reconsiderroadretire
if "%var%"=="2" goto outsideworld
if %nulcom%==yes call :noncommand
goto MUENZUKA
:outsideworld
echo.
echo DEV: WAIT WHAT?! DO YOU REALLY WANT MARISA TO BE IN OUR REAL WORLD!?
echo      That's gonna be so frickin' awesome BUT, YOU MAY NOT LEAVE GENSOKYO! D:^<
goto MUENZUKA
:roadtoriver
set lastplace=:roadtoriver
echo.
set var=BUGFIX
echo Road of liminality
echo You are on the Road of liminality. This road can lead you to Sanzu River.
echo Although it is at the other side of Youkai mountain, it is not possible to go
echo.on that way. Be aware though, you can walk this road while still alive, 
echo but mainly it is the dead who travel it on their way to the river.
echo It is also Chuu road, where people selling/buying things.
echo.
echo What do you want to do?
echo [1] Go to Chuu Road.
echo [2] Go back to the forest.
call :CHOICEMENU
if "%var%"=="1" goto roadtoriver0
if "%var%"=="2" goto forest
if %nulcom%==yes call :noncommand
goto roadtoriver
:roadtoriver0
set lastplace=:roadtoriver0
echo.
set var=BUGFIX
echo Road of liminality - Chuu Road
echo You are on the Chuu Road, where people selling/buying things.
echo.
echo What do you want to do?
echo [1] Talk to someone there.
echo [2] Go Back for a bit.
echo [3] Go to the Sanzu River.
call :CHOICEMENU
if "%var%"=="1" goto roadtoriver0talk
if "%var%"=="2" goto roadtoriver
if "%var%"=="3" goto roadtoriver1
if %nulcom%==yes call :noncommand
goto roadtoriver0
:roadtoriver1
set lastplace=:roadtoriver1
echo.
set var=BUGFIX
echo Along the Sanzu River
echo You are along the Sanzu River. It is impossible to cross because it look like
echo the density of water is low and so things and humans cannot float.
echo The other side of the river is Higan, the place where there is no weather,
echo no seasons, no night/day, only infinite flower field with some warmth.
echo It'd be best to just look there and go back for now.
echo.
echo What do you want to do?
echo [1] Go to Chuu Road (go back).
call :CHOICEMENU
if "%var%"=="1" goto roadtoriver0

if %nulcom%==yes call :noncommand
goto roadtoriver1
:netherworldentrypre
set turnadd=5
echo.
echo Going up to the Netherworld . . .
ping localhost -n 3 >nul
:netherworldentry
REM Location info: From Touhou Anime (Memories of Phantasm)
REM And from Touhou 7 (Stage 4-5)
:netherworldentryfoes
set /a foe=%random%/256
if %foe% GTR 40 goto netherworldentrymenu
if %foe% LEQ 20 goto Prismriver
goto netherworldentryfoes
:netherworldentrymenu
set lastplace=:netherworldentrymenu
echo.
set var=BUGFIX
echo Netherworld entrance
echo You are at the entrance to Netherworld. This entrance lies
echo very high from the cloud. Prismriver Sisters are at the entrance.
echo.
echo What do you want to do?
echo [1] Go to Netherworld.
echo [2] Go down to your house.
call :CHOICEMENU
if "%var%"=="1" goto netherworld
if "%var%"=="2" goto marisahouse
if %nulcom%==yes call :noncommand
goto netherworldentrymenu
:netherworld
set lastplace=:netherworld
set mount=0
set climb=no
set defeat_youmu=no
set defeat_yuyuko=no
echo.
echo Netherworld
echo You in the Netherworld. You see a large upward stairway with
echo around a thousand of steps to go.
echo.
echo What do you want to do?
echo [1] Go up the stairway!
echo [2] Exit the Netherworld.
call :CHOICEMENU
if "%var%"=="1" goto netherworldclimb
if "%var%"=="2" goto netherworldentry
if %nulcom%==yes call :noncommand
goto netherworld
:netherworldclimb
set climb=yes
set var=BUGFIX
:netherworldclimbUP
set turnadd=5
echo.
echo Going up the stairway . . .
ping localhost -n 2 >nul
REM this time, mount is in percent
set /a mount=%mount%+%random%/2048+8
if %mount% GEQ 100 ( set /a mount=100) & goto Hakugyokurou
goto netherworldclimb

:netherworldclimbDOWN
echo.
echo Going down the stairway . . .
ping localhost -n 2 >nul
set /a mount=%mount%-(%random%/2048+12)
if %mount% LSS 5 goto netherworld
goto netherworldclimbmenu

:netherworldclimb
set climb=yes
:netherworldclimbfoes
set /a foe=%random%/4096+90
REM now related to location
if %foe% GTR %mount% goto netherworldclimbmenu
if %foe% LEQ %mount% if %defeat_Youmu%==no goto Youmu
goto netherworldclimbmenu

:netherworldclimbmenu
set lastplace=:netherworldclimbmenu
set var=BUGFIX
echo.
echo Netherworld Stairway
echo You are now going up the stair, %mount%%% of the way to Hakugyokurou.
echo.
echo What do you want to do?
echo [1] Climb up more.
echo [2] Go down.
call :CHOICEMENU
if "%var%"=="1" goto netherworldclimbUP
if "%var%"=="2" goto netherworldclimbDOWN
if %nulcom%==yes call :noncommand
goto netherworldclimbmenu
:Hakugyokurou
set lastplace=:Hakugyokuroumenu
:Hakugyokuroufoes
set /a foe=%random%/256
if %foe% GTR 40 goto Hakugyokuroufoes
if %foe% LEQ 30 if %defeat_yuyuko%==no goto Yuyuko
goto Hakugyokuroumenu
:Hakugyokuroumenu
echo.
set var=BUGFIX
echo Hakugyokurou
echo This place is a ghost shrine overlooking the netherworld. It is well known
echo among the afterlife realms for its cherry blossom gardens, and many ghosts
echo come to see them every spring. Youmu and Yuyuko lives here.
echo You should be proud that you managed to come to this place! Hooray!
echo.
echo What do you want to do?
echo [1] Take a look at the Cherry Blossom Tree.
echo [2] Exit Hakugyokurou.
call :CHOICEMENU
if "%var%"=="1" goto Hakugyokuroutree
if "%var%"=="2" ( set mount=94) & goto netherworldclimbmenu
if %nulcom%==yes call :noncommand
goto Hakugyokuroumenu
:Hakugyokuroutree
echo.
echo Estimating the growth of the Cherry Blossom Tree . . .
set /a treebloom0=%turnall%/700+1
if %treebloom0% GEQ 10 set treebloom0=10
echo.
echo The tree seem to be %treebloom0%0%% grown.
goto Hakugyokurou
:kourindou
set lastplace=:kourindou
echo.
set var=BUGFIX
echo Kourindou
echo You are at Kourindou. Rinnosuke is the owner.
echo It lies beside Human Village and Forest of Magic.
echo.
echo What do you want to do?
echo [1] Buy potions. (Cost: 55 Yens each.)
echo [2] Go to the forest.
echo [3] Go to Human Village.
call :CHOICEMENU
if "%var%"=="1" goto kourindoubuy
if "%var%"=="2" goto forest
if "%var%"=="3" goto humanvillage
if %nulcom%==yes call :noncommand
goto kourindou
:kourindoubuy
set turnadd=-10
if %stat2% LSS 55 goto kourindoubuynone
:kourindoubuy0
echo.
set varps=BUGFIX
echo How many healing potions? (You have %stat2% Yens.)
set /p varps=^>
set /a varp=%varps% 2>nul
if %varp% LEQ 0 goto kourindou
set /a total=%varp%*55
if %total% GTR %stat2% goto kourindoubuynotenough
if %total% LEQ %stat2% goto kourindoubought
goto kourindoubuy0
:kourindoubought
set turnadd=-5
set /a stat10=%stat10%+%varp%
set /a stat2=%stat2%-%total%
echo.
echo You bought %varp% potions. That costs %total% Yens total.
echo You now have %stat2% Yens left.
goto kourindou
:kourindoubuynotenough
echo.
echo You don't have enough money to buy for your wanted amount!
goto kourindoubuy
:kourindoubuynone
echo.
echo You don't even have enough money to buy one!
goto kourindou
:alicehouse
set lastplace=:alicehouse
echo.
set var=BUGFIX
echo Alice's House
echo You are at Alice's house. Her house is near yours.
echo.
echo What do you want to do?
echo [1] Enter Alice's house.
echo [2] Go to your house.
echo [3] Go to the forest.
call :CHOICEMENU
if "%var%"=="1" goto aliceinside
if "%var%"=="2" goto marisahouse
if "%var%"=="3" goto forest
if %nulcom%==yes call :noncommand
goto alicehouse
:aliceinside
set lastplace=:aliceinsidemenu
set /a Shanghainum=%turnall%/600-%shanghaidefeats%
:aliceinsidefoes
set /a foe=%random%/256
set /a shanghaifoe0=%shanghainum%
set /a shanghaifoe1=%shanghainum%*3/2
if %foe% GTR 40 goto aliceinsidefoes
if %foe% LEQ %shanghaifoe1% goto Shanghai
if %foe% LEQ %shanghaifoe0% goto Alice
goto aliceinsidemenu
:aliceinsidemenu
set /a Shanghainum=%turnall%/600-%shanghaidefeats%
set /a Shanghaiprogress=(%turnall%-%shanghainum%*600)/200
if %shanghaiprogress%==0 set Alicemaking=she just started with another doll
if %shanghaiprogress%==1 set Alicemaking=she is now half way creating another
if %shanghaiprogress%==2 set Alicemaking=she nearly finished her next doll
echo.
set var=BUGFIX
echo You are inside Alice house. Alice Margatroid is living here.
echo She made %Shanghainum% Shanghai dolls and %Alicemaking%.
echo.
echo What do you want to do?
echo [1] Talk to Alice.
echo [2] Go outside of Alice's House.
call :CHOICEMENU
if "%var%"=="1" goto alicetalk
if "%var%"=="2" goto alicehouse
if /i "%var%"=="steal the precious thing" goto easteregg0
if /i "%var%"=="steal precious thing" goto easteregg0
if /i "%var%"=="steal" goto easteregg0
if %nulcom%==yes call :noncommand
goto aliceinsidemenu
:easteregg0
echo.
echo  ## ##  ##  ###  ###  ###  ##      ### #####  ###  #    ####    ##### #  # ####
echo  # # # #  # #  #  #  #    #  #    #      #   #   # #    #         #   #  # #
echo  # # # #### ###   #   ##  ####     ##    #   #   # #    ###       #   #### ###
echo  #   # #  # # #   #     # #  #       #   #   #   # #    #         #   #  # #
echo  #   # #  # #  # ### ###  #  #    ###    #    ###  #### ####      #   #  # ####
echo.
echo    ###  ###  ####  ### ###  ###  #   #  ###    ##### #  # ### #   #  ####  #
echo    #  # #  # #    #     #  #   # #   # #         #   #  #  #  ##  # #      #
echo    ###  ###  ###  #     #  #   # #   #  ##       #   ####  #  # # # #  ##  #
echo    #    # #  #    #     #  #   # #   #    #      #   #  #  #  #  ## #   #
echo    #    #  # ####  ### ###  ###   ###  ###       #   #  # ### #   #  ###   #
if %hasnet%==1 start www.youtube.com/watch?v=rAbhJk4YJns
echo.
pause
goto easterfound
:bamboo
set lastplace=:bamboo
echo.
echo Bamboo Forest of the lost
echo This place can drive your balance insane as reeds are growing so fast
echo that it doesn't look the same in the same location (scenery is changing).
echo The bamboo are also leaning diagonally. No humans will dare to go here.
echo There are no landmark in this forest. You may become lost in this place.
echo However, it is said that there are hidden things in this forest.
:bamboofoes
set /a foe=%random%/256
if %foe% GTR 40 goto bamboomenu
if %foe% LEQ 5 goto randomrabbit
if %foe% LEQ 8 goto tewi
goto bamboofoes
:bamboomenu
echo.
set var=BUGFIX
echo What do you want to do?
echo [1] Go to Eientei.
echo [2] Go to Forest of Magic.
echo [3] Go to a path to Hakurei Shrine.
call :CHOICEMENU
if "%var%"=="1" goto bamboowalk0
if "%var%"=="2" goto bamboowalk1
if "%var%"=="3" goto bamboowalk2
if %nulcom%==yes call :noncommand
goto bamboomenu
:bamboowalk0
set turnadd=10
echo.
echo You are trying to go to Eientei . . .
ping localhost -n 2 >nul
:a0
set num=%random%
if %num% GTR 1100 goto a0
if %num% GTR 1000 goto mokouhelp
if %num% LSS 300 goto eientei
goto bamboofail
:bamboowalk1
set turnadd=5
echo.
echo You are trying to go to Forest of Magic . . .
ping localhost -n 2 >nul
:a1
set num=%random%
if %num% GTR 1100 goto a1
if %num% GTR 1000 goto mokouhelp
if %num% LSS 600 goto forest
goto bamboofail
:bamboowalk2
set turnadd=5
echo.
echo You are trying to go to a path to Hakurei Shrine . . .
ping localhost -n 2 >nul
:a2
set num=%random%
if %num% GTR 1100 goto a2
if %num% GTR 1000 goto mokouhelp
if %num% LSS 600 goto pathtoshrine
goto bamboofail
:bamboofail
set /a turnadd+=5
echo.
echo You couldn't find the place you wanted. You seem to be lost.
goto bamboofoes
:mokouhelp
set /a stat4+=1
:mokouhelp0
set /a turnadd+=5
echo.
set var=BUGFIX
echo You couldn't find the place you wanted. You seem to be lost.
echo Fortunately, you found Mokou. She can help people who lost in bamboo forest.
echo.
echo Mokou: "So, you seem to lost in this bamboo forest, right?
echo Don't worry, Marisa, I'll bring you to the place you want to go."
echo.
echo Where do you want Mokou to bring you to?
echo [1] Eientei.
echo [2] A path to Hakurei Shrine.
echo [3] Forest of Magic.
set /p var=^>
if "%var%"=="1" goto bamboomokou
if "%var%"=="2" goto pathtoshrine
if "%var%"=="3" goto forest
if %nulcom%==yes ( echo.) & echo That's not an option -daze!
goto mokouhelp0
:bamboomokou
set /a turnadd+=5
echo.
echo "I'll try to go there... I don't know if Kaguya is there outside..."
ping localhost -n 2 >nul
:a4
set num=%random%
if %num% GTR 1000 goto a4
if %num% LSS 600 goto eientei
goto bamboomokoufail
:bamboomokoufail
echo.
echo "Uhh! I think she is there outside. I can't send you there. I'm sorry.
echo not that because Kaguya is dangerous, but I hate Kaguya... so much.
echo Also I don't have much time now. See you again if you found me."
goto bamboo
:eientei
set lastplace=:eientei
echo.
set var=BUGFIX
echo Eientei
echo This is the building that is hidden in in the bamboo forest.
echo Eirin and Kaguya have been hiding here since their exile from the Moon.
echo.
echo What do you want to do?
if %stat6% LEQ %hp0% echo [1] "HELP ME, ERINNNNN!!" (Cost: 20 Yens. You have %stat2% Yens.)
if %stat6% GTR %hp0% echo [1] "Eirin, please cure me." (Cost: 20 Yens. You have %stat2% Yens.)
echo [2] Remove your BAC (Cost: 18 Yens per 0.01%% of BAC.)
echo [3] Talk to Eirin.
echo [4] Talk to Kaguya.
echo [5] Go into the bamboo forest.
call :CHOICEMENU
if "%var%"=="1" goto eienteieirincure
if "%var%"=="2" goto eienteieirincure0
if "%var%"=="3" goto eirintalk
if "%var%"=="4" goto kaguyatalk
if "%var%"=="5" goto bamboo
if /i "%var%"=="overdrive" goto easteregg1
if %nulcom%==yes call :noncommand
goto eientei
:easteregg1
for /l %%g in (0,1,24) do echo OVERDRIVE-OVERDRIVE-OVERDRIVE-OVERDRIVE-OVERDRIVE-OVERDRIVE-OVERDRIVE-OVERDRIVE
if %hasnet%==1 start www.youtube.com/watch?v=JB5IIsX0wS4
pause
goto easterfound
:eienteieirincure
echo.
if %stat2% LSS 20 ( echo "I'm sorry but you must have enough money so I can cure you.") & goto eientei
if %stat6%==%stat6a% ( echo "You are already fine, isn't it?") & goto eientei
if %stat6% LEQ %hp1% echo "Uh!! don't be scared Marisa, I'll help you!"
if %stat6% GTR %hp1% echo "There you go, Marisa."
set /a turnadd+=5
set /a stat2-=20
set /a stat6=%stat6a%
set /a stat12int=(%stat6a%-%stat6%)*120
set /a stat12-=%stat12int%
echo.
echo You have been healed to your maximum HP! [%stat6%/%stat6a% HP].
goto eientei

:eienteieirincure0
echo.
set /a stat11a=%stat11%*18
if %stat2% LSS %stat11a% ( echo "Each 0.01%% of BAC removal costs 18 Yens. Sorry, you need %stat11a% Yens.") & goto eientei
if %stat11%==0 ( echo "As I checked, you have BAC of 0.00%%. You're already good.") & goto eientei
echo "Alright, I'm done. You can pay me %stat11a% Yens."
set /a turnadd+=5
set /a stat2=%stat2%-%stat11a%
set /a stat11=0
set /a stat12int=%stat11a%*50
set /a stat12-=%stat12int%
echo.
echo Your BAC has been removed! (BAC is now 0.00%%)
goto eientei

:pathtoshrine
set lastplace=:pathtoshrine
:pathtoshrinefoes
set /a foe=%random%/256
if %foe% GTR 40 goto pathtoshrinemenu
if %foe% LEQ 5 goto sunny
if %foe% LEQ 10 goto luna
if %foe% LEQ 15 goto star
goto pathtoshrinefoes
:pathtoshrinemenu
echo.
set var=BUGFIX
echo Path to Hakurei Shrine
echo You are in a path that leads to Hakurei Shrine, also lead to Human Village.
echo Forest of Magic and Bamboo forest lie between this path.
echo The Three Mischievous Fairies are also somewhere here.
echo.
echo Where do you want to go?
echo [1] Hakurei Shrine
echo [2] Human Village
echo [3] Forest of Magic
echo [4] Bamboo forest
call :CHOICEMENU
if "%var%"=="1" goto hakureishrine
if "%var%"=="2" goto humanvillage
if "%var%"=="3" goto forest
if "%var%"=="4" goto bamboo
if %nulcom%==yes call :noncommand
goto pathtoshrinemenu
:hakureishrine
echo.
set var=BUGFIX
set lastplace=hakureishrine
echo Hakurei Shrine
echo You are at Hakurei Shrine, which is owned be Reimu Hakurei. She is living here.
echo You can help her by giving donations. (You donated the total of %stat3% Yens.)
echo She currently have %mony% Yens from the donation.
echo.
echo What do you want to do
echo [1] Donate to Hakurei Shrine. (You have %stat2% Yens.)
echo [2] Talk to Reimu.
echo [3] Go to a path to Hakurei Shrine.
call :CHOICEMENU
if "%var%"=="1" goto donate0
if "%var%"=="2" goto reimutalk
if "%var%"=="3" goto pathtoshrine
if /i "%var%"=="waki miko reimu" goto easteregg2
if /i "%var%"=="waku miko reimu" goto easteregg2
if /i "%var%"=="armpits" goto easteregg2
if /i "%var%"=="neko miko reimu" goto easteregg2a
if /i "%var%"=="commercial" goto easteregg2b
if /i "%var%"=="commercial appearance" goto easteregg2b
if /i "%var%"=="Graffiti Kingdom" goto easteregg2c
if %nulcom%==yes call :noncommand
goto hakureishrine
:easteregg2
echo.
echo ARMPITZ!!1! :DD
if %hasnet%==1 start www.youtube.com/watch?v=gOt1d9NGKA0
goto easterfound
:easteregg2a
echo.
echo OMFG CAT RAYMOO!!1!!1
if %hasnet%==1 start www.youtube.com/watch?v=9z8-lAOsEhQ
goto easterfound
:easteregg2b
echo.
echo SHE IS IN GRAFFITI KINGDOM, as Flying Maiden! PROOF SENT!
if %hasnet%==1 start www.youtube.com/watch?v=ORpB26JlF0k#t=2m00s
goto hakureishrine
:easteregg2c
echo.
echo YES! SHE IS IN GRAFFITI KINGDOM!
if %hasnet%==1 start www.youtube.com/watch?v=ORpB26JlF0k#t=2m57s
goto hakureishrine
:reimutalk
echo.
echo "Hi, Marisa, I'm Reimu Hakurei. If you come here, you should donate
echo to the Hakurei Shrine which is mine. But wait! your donation will increase
echo your Defense by 1 every 60 Yens you donated! Isn't that amazing? Donate now!"
goto hakureishrine
:donate0
set turnadd=-10
if %stat2%==0 goto donatenone
:donate
echo.
set vards=BUGFIX
echo How much money do you want to donate? (You have %stat2% Yens.)
set /p vards=^>
set /a vard=%vards% 2>nul
if %vard% LEQ 0 goto hakureishrine
if %vard% GTR %stat2% goto donatenotenough
if %vard% LEQ %stat2% goto donated
goto donate
:donated
set turnadd=-5
if /i %vard% GEQ 100 if %hasnet%==1 start www.youtube.com/watch?v=TwNIib1tS1g
set /a stat2=%stat2%-%vard%
set /a stat3=%stat3%+%vard%
set /a mony=%mony%+%vard%
set /a stat9=%stat3%/60
set /a stat12int=%vard%*650
set /a stat12+=%stat12int%
call :SCORESP
echo.							Score  %stat12sp%%stat12%
echo You just donated %vard% Yens! Reimu was pleased.	     Hi-score  %stat12hisp%%stat12hi%
echo Also, your donation is appreciated. You have %stat2% Yens left.
goto hakureishrine
:donatenone
echo.
echo You don't even have your money for your donation!
goto hakureishrine
:donatenotenough
echo.
echo You don't have enough money for your wanted amount!
goto donate
:humanvillage
echo.
set var=BUGFIX
set lastplace=humanvillage
echo Human Village
echo You are in Human Village, this is the place where normal humans live.
echo You can sold your mushrooms and get your money.
echo.
echo What do you want to do?
echo [1] Talk to a random human.
echo [2] Sell your mushrooms.
echo [3] Sell your seaweed.
echo [4] Go to Scarlet Devil Mansion.
echo [5] Go to Misty Lake.
echo [6] Go to a path to Hakurei Shrine.
echo [7] Go to Kourindou.
call :CHOICEMENU
if "%var%"=="1" goto humantalk
if "%var%"=="2" goto humansell
if "%var%"=="3" goto human2sell
if "%var%"=="4" goto sdmb
if "%var%"=="5" goto mistylake
if "%var%"=="6" goto pathtoshrine
if "%var%"=="7" goto kourindou
if %nulcom%==yes call :noncommand
goto humanvillage
:humansell
set turnadd=-10
if %stat0%==0 goto humansellnone
:humansell0
echo.
set varps=BUGFIX
echo How many mushrooms do you want to sell? (You have %stat0% mushrooms.)
set /p varps=^>
set /a varp=%varps% 2>nul
set /a profit=%varp%*19
if %varp% LEQ 0 goto humanvillage
if %varp% GTR %stat0% goto humansellnotenough
if %varp% LEQ %stat0% goto humansold
goto humansell0
:humansold
set turnadd=-5
set /a stat0=%stat0%-%varp%
set /a stat1=%stat1%+%varp%
set /a stat2=%stat2%+%profit%
set /a stat12int=%profit%*200
set /a stat12+=%stat12int%
call :SCORESP
echo 							   Score  %stat12sp%%stat12%
echo You sold %varp% mushrooms. You have a profit of %profit% Yens.	Hi-Score  %stat12hisp%%stat12hi%
echo You now have %stat2% Yens.
goto humanvillage
:humansellnotenough
echo.
echo You don't have enough mushroom you wanted to sell!
goto humansell
:humansellnone
echo.
echo You don't even have any mushroom for your sale!
goto humanvillage




:human2sell
set turnadd=-10
if /i %stat14%==0 goto human2sellnone
:human2sell0
echo.
set varps=BUGFIX
echo How much seaweed do you want to sell in grams? (You have %stat14% grams.)
set /p varps=^>
set /a varp=%varps% 2>nul
set /a profit=%varp%*3/2
if %varp% LEQ 0 goto humanvillage
if %varp% GTR %stat14% goto human2sellnotenough
if %varp% LEQ %stat14% goto human2sold
goto human2sell0
:human2sold
set turnadd=-5
set /a stat14=%stat14%-%varp%
set /a stat2=%stat2%+%profit%
set /a stat12int=%profit%*300
set /a stat12+=%stat12int%
call :SCORESP
echo 							   Score  %stat12sp%%stat12%
echo You sold %varp% grams of seaweed.    			Hi-Score  %stat12hisp%%stat12hi%
echo You have a profit of %profit% Yens. You now have %stat2% Yens.
goto humanvillage
:human2sellnotenough
echo.
echo You don't have that much seaweed you wanted to sell!
goto human2sell
:human2sellnone
echo.
echo You don't even have any seaweed for your sale!
goto humanvillage



:sdma
echo.
echo You are trying to go from Misty Lake to Scarlet Devil Mansion . . .
ping localhost -n 2 >nul 
:sdm0
set /a foe=%random%/256
if %foe% GTR 40 goto sdm0
if %foe% LEQ 20 goto Meiling
goto sdm2
:sdmb
echo.
echo You are trying to go from Human Village to Scarlet Devil Mansion . . .
ping localhost -n 2 >nul 
:sdm1
set /a foe=%random%/256
if %foe% GTR 40 goto sdm1
if %foe% LEQ 25 goto Meiling
goto sdm2
:sdm2
set lastplace=:sdm2
echo.
set var=BUGFIX
echo Scarlet Devil Mansion
echo You are at Scarlet Devil Mansion. This mansion appears to be 2 stories tall.
echo Meiling guards the gate. However, guards unsecurely and sometimes fall asleep.
echo.
echo What do you want to do?
echo [1] Enter the mansion.
echo [2] Go to Human village.
echo [3] Go to Misty Lake.
call :CHOICEMENU
if "%var%"=="1" goto SDMgreatlibrary
if "%var%"=="2" goto humanvillage
if "%var%"=="3" goto mistylake
if %nulcom%==yes call :noncommand
goto sdm2
:SDMgreatlibrary
set lastplace=:SDMgreatlibrary
echo.
set var=BUGFIX
echo Great Libary
echo You are in Great Libary room, inside the mansion. Patchouli lives here.
echo She is reading book like usual. The library is huge in size.
echo.
echo What do you want to do?
echo [1] Talk to Patchouli.
echo [2] Exit the mansion.
echo [3] Go to the hallway.
echo [dev] See creator's note.
call :CHOICEMENU
if "%var%"=="2" goto sdm2
if "%var%"=="1" goto patchoulitalk
if "%var%"=="3" goto SDMhallway
if /i "%var%"=="dev" goto SDMdevnotes
if %nulcom%==yes call :noncommand
goto SDMgreatlibrary
:SDMdevnotes
echo.
echo [I can't seem find the clear information regarding the rooms in SDM.
echo So, place names are not official and connections are assumed.]
goto SDMgreatlibrary
:SDMhallway
set lastplace=:SDMhallway0
echo.
echo SDM Hallway
echo You are at the hallway in SDM. This hallway is almost regularly cleaned by
echo a maid, Sakuya. She is cleaning as usual.
:SDMhallwayfoes
set /a foe=%random%/256
if %foe% GTR 40 goto SDMhallwayfoes
if %foe% LEQ 10 goto sakuya
if %foe% LEQ 15 goto Sakuyapassive
goto SDMhallwaymenu
:SDMhallway0
echo.
echo SDM Hallway
echo You are at the hallway in SDM. This hallway is almost regularly cleaned by
echo a maid, Sakuya. She is cleaning as usual.
:SDMhallwaymenu
echo.
set var=BUGFIX
echo What do you want to do?
echo [1] Go to the Great Library.
if %foe% LEQ 30 echo [2] Talk to Sakuya.
call :CHOICEMENU
if "%var%"=="1" goto SDMgreatlibrary
if "%var%"=="2" if %foe% LEQ 30 goto sakuyatalk
if %nulcom%==yes call :noncommand
goto SDMhallway0
:mistylake
set lastplace=:mistymenu
:mistyfoes
set /a foe=%random%/256
if %foe% GTR 40 goto mistyfoes
if %foe% LEQ 4 goto cirno
if %foe% LEQ 7 goto Letty
if %foe% LEQ 10 goto daiyousei
goto mistymenu
:mistymenu
echo.
set var=BUGFIX
echo Misty Lake
echo You are in Misty Lake. Ice fairies live here, including the tomboy-ish one.
echo Scarlet Devil Mansion is the closest to this lake. Temprature is around 10'C.
echo.
echo What do you want to do?
echo [1] Go to Youkai Mountain.
echo [2] Go to Scarlet Devil Mansion.
echo [3] Go to Human Village.
echo [4] Go down to water surface.
call :CHOICEMENU
if "%var%"=="1" goto youkaimountain
if "%var%"=="2" goto sdma
if "%var%"=="3" goto humanvillage
if "%var%"=="4" goto seaweedtop
if %nulcom%==yes call :noncommand
goto mistymenu




:seaweedtop
set lastplace=:seaweedtopmenu
call :breath 70 0 false
set brturn=%brfinal%
:seaweedtopfoes
set /a foe=%random%/256
if %foe% GTR 40 goto seaweedtopfoes
if %foe% LEQ 3 goto cirno
if %foe% LEQ 5 goto Letty
if %foe% LEQ 7 goto daiyousei
goto seaweedtopmenu
:seaweedtopmenu
echo.
set var=BUGFIX
echo Misty Lake - Water surface
echo You are on the water, floating in Misty Lake.
echo.
echo What do you want to do?
echo [1] Go underwater.
echo [2] Go up over the surface.
call :CHOICEMENU
if "%var%"=="1" goto seaweedunder
if "%var%"=="2" goto mistylake
if %nulcom%==yes call :noncommand
goto seaweedtopmenu
:seaweedunder
echo.
set var=BUGFIX
echo Misty Lake - Underwater
echo You are now underwater. Some seaweed can be found.
if %brturn% LSS 1 set brmsg=YOU ARE DROWNING!! You need to go back to surface now!
if %brturn% GEQ 1 set brmsg=You are about to drown!
if %brturn% GEQ 10 set brmsg=You felt you can't breathe!
if %brturn% GEQ 20 set brmsg=You're feeling really uncomfortable with your breath.
if %brturn% GEQ 30 set brmsg=You felt it's getting difficult bring underwater.
if %brturn% GEQ 40 set brmsg=You seem not to be able to be steady.
if %brturn% LEQ 50 echo %brmsg%
echo.
echo What do you want to do?
echo [1] Find some seaweed.
echo [2] Back up to the surface.
set /p var=^>
if %brturn% LSS 1 set /a stat6-=20
if %stat6% LSS 1 goto defeatX
if "%var%"=="1" if %brturn% LSS 10 goto seaweedcannot
if "%var%"=="1" goto seaweedfind
if "%var%"=="2" goto seaweedtop
goto seaweednulcom
:seaweedfind
set /a brturn-=8
set /a turnadd+=5
echo.
echo You are now finding some seaweed . . .
ping localhost -n 3 >nul
:seaweedfind0
set /a num=%random%/256
if %num% GTR 100 goto seaweedfind0
if %num% LSS 90 goto seaweedfound
goto seaweedfail
:seaweedfound
set /a stat14int=%random%/8192+3
set /a stat14+=%stat14int%
set /a stat13+=1
set /a stat12int=1200*%stat14int%
set /a stat12+=%stat12int%
echo 							Score  %stat12sp%%stat12%
echo You found %stat14int% grams of seaweed!			     Hi-Score  %stat12sp%%stat12%
echo Your total seaweed weight is now %stat14% grams.
goto seaweedunder
:seaweedfail
set /a brturn-=4
set /a turnadd+=3
echo.
echo You couldn't find any seaweed underwater.
goto seaweedunder
:seaweedcannot
set /a brturn-=4
set /a turnadd+=1
echo.
echo You couldn't try to find them because you can't breath!
goto seaweedunder
:seaweednulcom
set /a brturn-=1
REM lolwut?
echo.
if %brturn% LEQ 0 ( echo Bll..ugg! bluuggh...uughhg!!!) & goto seaweedunder
if %brturn% LEQ 5 ( echo Uguu...bl uughh!!) & goto seaweedunder
if %brturn% LEQ 10 ( echo Uugh...uu uuh!) & goto seaweedunder
if %brturn% LEQ 20 ( echo Uh!...uuuhh!!) & goto seaweedunder
if %brturn% LEQ 35 ( echo U...uh!) & goto seaweedunder
if %brturn% LEQ 50 ( echo ...!) & goto seaweedunder
if %brturn% GTR 50 ( echo ...) & goto seaweedunder
if %brturn% LSS 1 set stat6+=18
REM lol...
:youkaimountain
set mount=0
set climb=no
set lastplace=youkaimountain
:youkaimountainfoes
set /a foe=%random%/256
if %foe% GTR 40 goto youkaimountainfoes
if %foe% LEQ 5 goto Nitoridecide
if %foe% LEQ 8 goto Momijipassive
if %foe% LEQ 12 goto Ayapassive
if %foe% LEQ 15 goto Suikapassive
goto youkaimountainmenu
:youkaimountainmenu
echo.
echo Base of Youkai Mountain
echo You are at the base of Youkai Mountain.
echo At the base there are Kappas and Tengus wandering somewhere here.
echo.
set var=BUGFIX
echo What do you want to do?
echo [1] Climb up!
echo [2] Go to Misty Lake.
call :CHOICEMENU
if "%var%"=="1" goto youkaimountainclimbUP
if "%var%"=="2" goto mistylake
if %nulcom%==yes call :noncommand
goto youkaimountainmenu
:youkaimountainclimbUP
set turnadd=10
echo.
echo You are now climbing up Youkai Mountain . . .
ping localhost -n 3 >nul

set /a mount=%mount%+%random%/256+400
if %mount% GTR 2800 set /a mount=%mount%-90
if %mount% GTR 4200 set /a mount=%mount%-90
if %mount% GTR 5100 set /a mount=%mount%-90
if %mount% GTR 5500 set /a mount=%mount%-90
if %mount% GEQ 5760 ( set /a mount=5760) & goto youkaimountainclimbTOP
goto youkaimountainclimb
:youkaimountainclimbDOWN
echo.
echo You are now climbing down . . .
ping localhost -n 2 >nul
set /a mount=%mount%-(%random%/256+500)
if %mount% LSS 200 goto youkaimountain
goto youkaimountainclimb
:youkaimountainclimb
set climb=yes
set var=BUGFIX
REM This is after climbing
:youkaimountainclimbfoes
set /a foe=%random%/256
if %foe% GTR 40 goto youkaimountainclimbfoes
if %foe% LEQ 3 goto youkaimountainclimbfoes
if %foe% LEQ 6 if %mount% LEQ 2400 goto Momijipassive
if %foe% LEQ 10 if %mount% LEQ 4200 goto Ayapassive
if %foe% LEQ 12 if %mount% LEQ 1000 goto Suikapassive
goto youkaimountainclimbmenu
:youkaimountainclimbmenu
set lastplace=:youkaimountainclimbmenu
echo.
echo Youkai Mountain
echo You are on the Youkai Mountain, climbing.
echo The altitude is now %mount%m.
if %mount% GEQ 3500 if %mount% LEQ 3900 echo You can see Moriya Shrine in your sight. 
echo.
echo What do you want to do?
echo [1] Climb up more.
echo [2] Climb down.
if %mount% GEQ 3500 if %mount% LEQ 3900 echo [3] Go to Moriya Shrine.
call :CHOICEMENU
if "%var%"=="1" goto youkaimountainclimbUP
if "%var%"=="2" goto youkaimountainclimbDOWN
if %mount% GEQ 3500 if %mount% LEQ 3900 if "%var%"=="3" goto moriyashrine
if %nulcom%==yes call :noncommand
goto youkaimountainclimbmenu
:youkaimountainclimbTOP
echo.
set var=BUGFIX
echo Top of Youkai Mountain
echo You are on the top of the Youkai Mountain! Woah! That's a long way.
echo The measured elevation of this mountain is %mount%m!
echo.
echo What do you want to do?
echo [1] Climb down.
call :CHOICEMENU
if "%var%"=="1" goto youkaimountainclimbDOWN
if %nulcom%==yes call :noncommand
goto youkaimountainclimbTOP
:moriyashrine
set lastplace=:moriyashrine
echo.
set var=BUGFIX
echo Moriya Shrine
echo You are at Moriya Shrine. It located at the middle of Youkai Mountain.
echo This shrine is owned by Sanae Kochiya. She is now living here, also Suwako.
echo.
echo What do you want to do?
echo [1] Talk to Sanae.
echo [2] Talk to Suwako.
echo [3] Exit Moriya Shrine.
call :CHOICEMENU
if "%var%"=="1" goto sanaetalk
if "%var%"=="2" goto suwakotalk
if "%var%"=="3" ( set /a mount=3640) & goto youkaimountainclimb
if %nulcom%==yes call :noncommand
goto moriyashrine
:easterfound
cls
echo Woo!!! Nice Job! You just found the easter egg!
goto %lastplace%
:marisabook
cls
echo ===== Welcome to Touhou 00 - Blindness of Observer! =====
echo This is an RPG game without a plot. It is meant to simulate Gensokyo.
echo You can travel almost anywhere in Gensokyo with your choice commands.
echo In 2011, nearly all games are graphic intense, losing all the 80's.
echo This game has a nostalgic feel. No computer should be without one!
echo.
echo ===== Adventure's Guide in Gensokyo =====
echo In your adventures, you should know how to increase your statuses.
echo If you want to have more attack and HP, you should level up!
echo However, Leveling up doesn't increase your defense.
echo To increase your defense, you should donate your money somewhere.
goto marisainside
:humantalk
echo.
echo You are talking to anyone . . .
echo.
echo Marisa: "Hi, I'm Marisa Kirisame. What do you want to say?"
ping localhost -n 4 >nul
:humantalk0
set /a ppl=%random%/256
if %ppl% GTR 20 goto humantalk0
if %ppl%==0 set ppmsg=Oh hey, you're one of the famous girls!
if %ppl%==1 set ppmsg=Thanks for visting this village Marisa.
if %ppl%==2 set ppmsg=Oh, I think you are so curious, lol. You just love to ask...
if %ppl%==3 set ppmsg=Uhh, I am a Touhou fan here. I just accidentally went to Gensokyo!    Luckliy, because I remembered the theorized map. I came here.
if %ppl%==4 set ppmsg=Do you want some snack? Check them out in this village! Buy them.
if %ppl%==5 set ppmsg=Just to tell you, I can't believe it. Gensokyo is actually real!
if %ppl%==6 set ppmsg=I'd love to see Danmaku battle at least once on my naked eye.
if %ppl%==7 set ppmsg=If we have the internet, we'd post that Gensokyo is real!
if %ppl%==8 set ppmsg=Oh! You're cute. Whatever, have you encountered any F.O.E. already?
if %ppl%==9 set ppmsg=The Youkais in this village isn't hostile to us, don't worry.
if %ppl%==10 set ppmsg=Ahaha!! You're the great witch! Just only second to Reimu.
if %ppl%==11 set ppmsg=IDK how did I just came here from Osaka but I'm glad I do.
if %ppl%==12 set ppmsg=Uhh... nothing to say... except that you are nice.
if %ppl%==13 set ppmsg=The bamboo forest is good at making us lost there.
if %ppl%==14 set ppmsg=Did you stole Alice's precious thing yet? lol...
if %ppl%==15 set ppmsg=Did you played on Lunatic Mode yet? If so, that's awesome!
if %ppl%==16 set ppmsg=I'd like to ask you how many grazes did you got? A few hundreds?
if %ppl%==17 set ppmsg=Did you tried to climb the mountain? I think it isn't a great idea.
if %ppl%==18 set ppmsg=I bet you didn't play Easy Modo... Coz that's for kids and n00bs.
if %ppl%==19 set ppmsg=KAWAII DESU NEE-!! GO MARISA, YOU CAN DO IT! Save the world!
if %ppl%==20 set ppmsg=You can start your own shop here. Do it now and good luck!
echo Someone: "%ppmsg%"
goto humanvillage
REM ===== C H U U   R O A D  P E O P L E  D I A L O U G E S =====::
:roadtoriver0talk
echo.
echo You are talking to anyone . . .
echo.
echo Marisa: "Hi, I'm Marisa Kirisame. What do you want to say?"
ping localhost -n 4 >nul
:roadtoriver0talk0
set /a ppl2=%random%/256
if %ppl2% GTR 6 goto roadtoriver0talk0
if %ppl2%==0 set ppmsg=The opposite side of the river is not in Gensokyo,    		but is the realms of the dead. That's the fact.
if %ppl2%==1 set ppmsg=The other side of the river is Higan. I think no one  		can go there without being alive IMHO.
if %ppl2%==2 set ppmsg=It's impossible to apply... 'science' to the river,   		because... 'only' shinigami's boat... floats. All other things sink.
if %ppl2%==3 set ppmsg=No one of us will try to cross Sanzu River, not even visiting it!
if %ppl2%==4 set ppmsg=I'd give an advice that you'd better not visiting the river.
if %ppl2%==5 set ppmsg=We sell things for you. Why don't you buy some?
if %ppl2%==6 set ppmsg=Why visit Sanzu River? There is nothing beautiful there.
echo Someone: "%ppmsg%"
goto roadtoriver0
REM ===== T H E   B A T T L E   S Y S T E M =====::
:battle
set /a yenreward=%random%/8192+((%foehp%*%foedmg%)/160)
set /a foehp=%foehp%*%difffact%
set /a foehpmax=%foehp%
set /a foedmg=%foedmg%*%difffact%
echo.
echo You have encountered %foename%!
set /a msparkready=%stat11%*2+12
:battle0
set var=BUGFIX
echo %foeshort%'s HP: %foehp%/%foehpmax%
echo Marisa's HP: %stat6%/%stat6a%
echo.
call :SCORESP
echo What will Marisa do?					Score  %stat12sp%%stat12%
echo [1] Fight    [2] Potion (%stat10%)  [3] Run		     Hi-Score  %stat12hisp%%stat12hi%
if %mspark% GEQ %msparkready% echo [4] Master Spark
set /p var=^>
cls
if "%var%"=="1" goto battlefight
if "%var%"=="2" goto battlepotion
if "%var%"=="3" goto battlerun
if "%var%"=="4" if %mspark% GEQ %msparkready% goto battlespark
goto battle0
:battlefight
set /a myspd=%random%/64+%stat15%
set /a mycrit=%random%/256
set /a mymiss=%random%/256
REM it's 128 max
if %foespd% GTR %myspd% goto battlefight0
:battlefight1
if %mymiss% LSS 32 goto battlefight1a

set /a myatk=(%random%/4096)+10+%stat5%-%stat11%*2
if %mycrit% LSS 32 set /a myatk=%myatk%*4/3
set /a stat12int=%myatk%*70
set /a stat12+=%stat12int%
set /a foehp=%foehp%-%myatk%
set /a mspark=%mspark%+1

echo You striked %foeshort% for %myatk% damage!
if %mycrit% LSS 32 echo (A critical hit!)
if %foehp% LSS 1 goto battledefeat
if %foespd% GTR %myspd% goto battle0
if %foespd% LEQ %myspd% goto battlefight0
:battlefight1a
echo Your attack missed %foeshort%!
set /a mspark=%mspark%+1
if %foespd% GTR %myspd% goto battle0
if %foespd% LEQ %myspd% goto battlefight0
:battlefight0
set /a turnadd+=2
REM Each battle turn uses 2 global turns.
set /a foeatk=(%random%/8192)+%foedmg%-%stat9%
if %foeatk% LSS 2 set /a foeatk=1
REM Prevented 0 HP damage...
set /a stat6=%stat6%-%foeatk%

if %stat6% LSS 1 set /a stat6=0
echo You took %foeatk% damage from %foeshort%!
if %stat6% LSS 1 goto defeat
if %foespd% GTR %myspd% if %var%==2 goto battlepotion0
if %foespd% GTR %myspd% if %var%==4 goto battlespark0
if %foespd% GTR %myspd% goto battlefight1
if %foespd% LEQ %myspd% goto battle0
:battlespark
set /a myspd=%random%/80+%stat15%
set /a mycrit=%random%/256
if %foespd% GTR %myspd% goto battlefight0
:battlespark0
set /a concen=(%stat11%*%stat11%)*10
set /a concenrand=%random%/64
if %concen% GTR %concenrand% goto battlesparkdrunk
set /a myatk=(%random%/4096)+((10+%stat5%)*2)-(%stat11%*%stat11%)
if %mycrit% LSS 32 set /a myatk=%myatk%*4/3
set /a stat12int=%myatk%*110
set /a stat12+=%stat12int%
set /a foehp=%foehp%-%myatk%
echo **MASUTAA SUPAAKU!!!**
ping localhost -n 2 >nul
echo Your Master Spark hit %foeshort% for %myatk% damage!
if %mycrit% LSS 32 echo (A critical hit!)
if %foehp% LSS 1 goto battledefeatspark
if %foespd% GTR %myspd% goto battle0
if %foespd% LEQ %myspd% goto battlefight0
:battlesparkdrunk
set stat11zeros=0
if %stat11% GEQ 10 set stat11zeros=
set /a mspark=%mspark%-4-%stat11%
echo You couldn't concentrate! Because of SAKE! (BAC: 0.%stat11zeros%%stat11%%%)
goto battlefight0
:battledefeat
set /a expgain=(%random%/8192)+%expworth%
set /a stat7=%stat7%+%expgain%
set /a stat12int=(%foehpmax%*%foedmg%+(%expworth%*15)+(%myatk%*5))*150
set /a stat12=%stat12int%*%difffact%/10*10+stat12
if %yendrop%==1 set /a stat2+=%yenreward%

echo %foename% was defeated!
call :SCORESP
if %yendrop%==1 echo %foeshort% gave you %yenreward% Yens!
echo You gained %expgain% EXP!					Score  %stat12sp%%stat12%
echo Your EXP is now %stat7%.				     Hi-Score  %stat12hisp%%stat12hi%
call :leveling
goto %locale%
:battledefeatspark
set /a expgain=(%random%/8192)+(%expworth%*3/2)
set /a stat7=%stat7%+%expgain%
set /a stat12int=(%foehpmax%*%foedmg%+(%expworth%*15)+(%myatk%*5))*120
set /a stat12=%stat12int%*%difffact%+stat12
if %yendrop%==1 set /a stat2=%stat2%+%yenreward%*4/3
set /a yenreward0=%yenreward%*4/3
echo %foename% was owned by your Master Spark!
call :SCORESP
if %yendrop%==1 echo %foeshort% rewarded you %yenreward0% Yens!
echo You gained %expgain% EXP!					Score  %stat12sp%%stat12%
echo Your EXP is now %stat7%!				     Hi-Score  %stat12hisp%%stat12hi%
call :leveling
%xparam%
goto %locale%
:battlepotion
if %stat10%==0 (
	echo You don't have any Potions left!
	goto battle0)
set /a myspd=%random%/48+%stat15%
if %foespd% GTR %myspd% goto battlefight0
:battlepotion0
set /a stat10-=1
set /a stat6+=60
if %stat6% GTR %stat6a% set stat6=%stat6a%
echo You healed 60 HP by using Potion!
if %foespd% GTR %myspd% goto battle0
if %foespd% LEQ %myspd% goto battlefight0
:battlerun
set /a esc=%random%/10
if %esc% GTR 1000 goto battlerun
if %esc% LSS %escape% goto battlerunyes
goto battlerunno
:battlerunno
echo You failed to run away from %foeshort%!
goto battlefight0
:battlerunyes
echo You sucessfully escaped %foename%!
goto %locale%
REM ============ E N E M Y   D A T A ============::
REM ===== M I S T Y   L A K E ' S   F O E S =====::
REM Extra EXP added by 0-4
REM FOE attacks added by 0-4 minus defense
REM Beta 1.5.3 Update: Speed; 1024 is absolute fast, 0 is absolute slow
:Cirno
set foename=Cirno
set foeshort=Cirno
set foehp=68
set foedmg=13
set foespd=250
set locale=mistymenu
set expworth=10
set escape=400
set yendrop=0
goto battle
:Letty
set foename=Letty Whiterock
set foeshort=Letty
set foehp=63
set foedmg=12
set foespd=275
set locale=mistymenu
set expworth=11
set escape=500
set yendrop=0
goto battle
:Daiyousei
set foename=Daiyousei
set foeshort=Daiyousei
set foehp=60
set foedmg=10
set foespd=280
set locale=mistymenu
set expworth=12
set escape=500
set yendrop=0
goto battle
REM ===== P A T H   T O   S H R I N E ' S   F O E S =====::
:Sunny
set foename=Sunny Milk
set foeshort=Sunny Milk
set foehp=71
set foedmg=13
set foespd=320
set locale=pathtoshrine
set expworth=14
set escape=400
set yendrop=1
goto battle
:Star
set foename=Star Sapphire
set foeshort=Star Sapphire
set foehp=69
set foedmg=11
set foespd=360
set locale=pathtoshrine
set expworth=14
set escape=400
set yendrop=1
goto battle
:Luna
set foename=Luna Child
set foeshort=Luna Child
set foehp=68
set foedmg=12
set foespd=320
set locale=pathtoshrine
set expworth=15
set escape=400
set yendrop=1
goto battle
REM ===== N E T H E R W O R L D ' S   F O E S =====::
REM Netherworld is only accessible when level GEQ 5 
:Prismriver
set foename=Prismriver Sisters
set foeshort=Prismriver
set foehp=90
set foedmg=15
set foespd=380
set locale=netherworldentrymenu
set expworth=18
set escape=300
set yendrop=0
goto battle
:Youmu
set foename=Youmu Konpaku
set foeshort=Youmu
set foehp=98
set foedmg=17
set foespd=420
set locale=Youmuend
set expworth=21
set escape=300
set yendrop=1
goto battle
:Youmuend
if %foehp% LSS 1 set defeat_Youmu=yes
goto netherworldclimbmenu
:Yuyuko
set foename=Yuyuko Saigyouji
set foeshort=Yuyuko
set foehp=110
set foedmg=19
set foespd=560
set locale=Yuyukoend
set expworth=23
set escape=100
set yendrop=1
goto battle
:Yuyukoend
if %foehp% LSS 1 set defeat_Yuyuko=yes
goto Hakugyokuroumenu
REM ===== M I S C ' S   F O E S =====::
:Meiling
set foename=Hong Meiling
set foeshort=Meiling
set foehp=75
set foedmg=8
set foespd=210
set locale=sdm2
set expworth=13
set escape=600
set yendrop=0
goto battle
:Sakuya
set foename=Sakuya Izayoi
set foeshort=Sakuya
set foehp=83
set foedmg=17
set foespd=720
set locale=Sakuyaend
set expworth=21
set escape=200
set yendrop=1
goto battle
:Sakuyaend
if %foehp% GTR 0 goto SDMhallway0
set stat16=1
echo.
echo Sakuya: "Uh, wow! couldn't believe you won the battle! Enjoy your tea!"
echo You have obtained Tea!
goto SDMhallway0
:Nitori
set foename=Nitori Kawashiro
set foeshort=Nitori
set foehp=69
set foedmg=13
set foespd=370
set locale=youkaimountain
set expworth=18
set escape=400
set yendrop=1
goto battle
:Rumia
set foename=Rumia
set foeshort=Rumia
set foehp=62
set foedmg=9
set foespd=300
set locale=forestmenu
set expworth=10
set escape=300
set yendrop=0
goto battle
:foe
set foename=FOE
set foeshort=FOE
set foehp=40
set foedmg=5
set foespd=180
set locale=forestmenu
set expworth=3
set escape=600
set yendrop=0
echo.
echo //Even in Text Adventures, FOE!//
goto battle
:Shanghai
set /a foenum=%shanghainum%-%shanghaidefeats%
set foename=Shanghai x%foenum%
set foeshort=Shanghai
set /a foehp=23*%foenum%
set /a foedmg=%foenum%*3+6
set /a foespd=300+%foenum%*50
set locale=Shanghaiend
set /a expworth=3+%foenum%*2
set /a escape=500-%foenum%*20
set yendrop=0
goto battle
:Shanghaiend
if %foehp% LSS 1 set /a shanghaidefeats+=%shanghainum%
if %foehp% GTR 0 goto aliceinsidemenu
goto alice
:Alice
set foename=Alice Margatroid
set foeshort=Alice
set foehp=72
set foedmg=14
set foespd=410
set locale=aliceinsidemenu
set expworth=17
set escape=400
set yendrop=1
goto battle
:RandomRabbit
set foename=Random rabbit
set foeshort=Rabbit
set foehp=53
set foedmg=7
set foespd=520
set locale=bamboo
set expworth=9
set escape=400
set yendrop=0
goto battle
:Tewi
set foename=Tewi Inaba
set foeshort=Tewi
set foehp=64
set foedmg=9
set foespd=590
set locale=bamboo
set expworth=12
set escape=400
set yendrop=1
goto battle
REM ====== C H A R A C T E R   D I A L O U G E S ======::
:Sakuyapassive
echo.
set var=n
echo Sakuya came toward you. Do you want to talk to her? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto Sakuyatalk
if /i "%var%"=="n" goto SDMhallway0
goto Sakuyapassive
:Sakuyatalk
echo.
echo "I'm cleaning! I'm a maid, Sakuya Izayoi. Since you could came here,
echo I think China... uhh... Meiling just doesn't do her work again..."
goto SDMhallway0

:eirintalk
echo.
echo "Hello, My name is Eirin Yagokoro. I'm a nurse, doctor or something like that.
echo My medicine is the best and can be garranteed to works with virtually anyone.
echo You can restore your health here with a cost of 20 Yens."
goto eientei

:kaguyatalk
echo.
echo "zzzZZZZZZZzzzzz... Whut??? Who... are you?? ZZZzzz..." (Kaguya won't wake up.)
goto eientei

:Nitoridecide
set /a foe=%random%/256
if %foe% GTR 40 goto Nitoridecide
if %foe% LEQ 30 goto Nitoripassive
if %foe% LEQ 40 goto Nitori
:Nitoripassive
echo.
set var=3
echo Nitori is passing by. What do you want to do?
echo [1] Talk to her.
if %foe% LEQ 10 echo [2] Underwater contest (8 Yens)
echo [3] Ignore.
set /p var=^>
if "%var%"=="1" goto Nitoritalk
if %foe% LEQ 10 if "%var%"=="2" goto Nitorichallenge
if "%var%"=="3" goto youkaimountainignore
goto Nitoripassive
:Nitoritalk
echo.
echo "Once again, I'm Nitori Kawashiro. I love to eat cucumbers. I'm a Kappa.
echo My technologies are all private, so no one can see them, even you.
echo I'm famous for having myself flipping out like crazy, lol. Actually, I'm a
echo water Kappa. I can control water, convert them to spellcards.
goto youkaimountain
:Nitorichallenge
echo.
echo "Really? I'm a water Kappa. So, I can breathe underwater, But to be fair,
echo I won't breathe! If you win, you get 6 Yens, but if you lose, you lose 6."
if %stat2% LSS 6 ( echo "But, you have less than 6 Yens. I don't want you to have a debt.") & goto youkaimountain
echo OK Ready, Marisa?
ping localhost -n 3 >nul
echo You and Nitori started the contest.
call :breath 125 1024
set /a nitori2=%random%/1024+150

set /a intn=%nitori2%/60
set /a decn=%nitori2%-%intn%*60
if %decn% LSS 10 set decn0=0
if %decn% GEQ 10 set decn0=

if %brfinal% GEQ %nitori2% goto NitorichallengeWIN
if %br5% GTR %br7% goto NitorichallengeDROWN
if %brfinal% LSS %nitori2% goto NitorichallengeLOSE

:NitorichallengeWIN
echo.
set /a stat2+=8
echo "Uuh!... Wow, great job! You just beat me, here's your 8 Yens."
echo You win!! Nitori breathed but you didn't first. You gained 8 Yens!

if %br5% LEQ %br7% set /a stat13=%int%+%stat13%
if %br5% GTR %br7% echo Also, you've managed to avoid drowning!
echo Marisa: %int%:%dec0%%dec% minutes  Nitori: %intn%:%decn0%%decn% minutes
goto youkaimountain

:NitorichallengeLOSE
echo.
set /a stat2-=8
set /a stat13=%int%/2+%stat13%
echo "Aww, sorry Marisa, but you lose. Now, give me 8 Yens."
echo You lose. You lost all of your breath and came up. You lost 6 yens.
echo Marisa: %int%:%dec0%%dec% minutes  Nitori: %intn%:%decn0%%decn% minutes
echo "Aww! No way, I wanna be Nitori! So I can eventually beat her..."
if %found1%==no echo Hint: Your wish can come true if you type it at your house (Spaces accepted).
goto youkaimountain
:NitorichallengeDROWN
echo.
set /a stat6=(%random%/-8192)+%stat6%-4
if %stat6% LEQ 0 goto NitorichallengeKILLED

echo "What happened Marisa? OMG! you're drowning!! I will help you!"
echo "Ok, you won't lose your 8 Yens because you drowned. I'm not that evil."
echo Your HP is now %stat6%/%stat6a%
goto youkaimountain
:NitorichallengeKILLED
echo "Marisa, what's wrong? Answer me please! Marisa?! MARISAAAA!!
ping localhost -n 4 >nul
goto defeatX

:youkaimountainignore
if %climb%==yes goto youkaimountainclimbmenu
goto youkaimountainmenu

:Ayapassive
echo.
set var=n
echo Aya is passing by. Do you want to talk to her? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto Ayatalk
if /i "%var%"=="n" goto youkaimountainignore
goto Ayapassive
:Ayatalk
echo.
echo "Hi, I'm a news reporter Aya Shameimaru. I run Bunbunmaru Newspaper.
echo There is nothing much so far. So, release of newspapers will be weekly.
echo Or if nothing is happening at all, relax time! Anyway, see you later."
if %climb%==yes goto youkaimountainclimb
goto youkaimountain
:Momijipassive
echo.
set var=n
echo Momiji see you. Do you want to talk to her? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto Momijitalk
if /i "%var%"=="n" goto youkaimountainignore
goto Momijipassive
:Momijitalk
echo.
echo "Oh yea, I saw you. I'm Momiji Inubashiri. Seeing far away is great.
echo Whatever, nothing much. I won't alway follow you, OK? See you if you want."
if %climb%==yes goto youkaimountainclimb
goto youkaimountain
:Suikapassive
echo.
set var=n
echo Suika is passing by. Do you want to talk to her? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto Suikatalk
if /i "%var%"=="n" goto youkaimountainignore
goto Suikapassive
:Suikatalk
echo.
set var=BUGFIX
echo "Aha! My another fellow! Marisa, I surely enjoy this place.
echo You already knew my favorite drink for sure. And hey,
echo I have one for you. Do you want to drink, Marisa?" [Y/N]
REM Blood Alchohol Content is like "Unluck", opposite of "Luck".
:suikatalk0
set /p var=^>
if /i "%var%"=="y" goto Suikatalkyes
if /i "%var%"=="n" goto Suikatalkno
echo.
goto Suikatalk0
:Suikatalkyes
echo.
set /a stat6=%stat6%+18
set /a stat11=%stat11%+1
if %stat6% GTR %stat6a% set stat6=%stat6a%
set stat11zeros=0
if %stat11% GEQ 10 set stat11zeros=
echo You drank Suika's favorite drink! It is Sake! You HP has increased by 18
echo along with your BAC! Your BAC is now 0.%stat11zeros%%stat11%%%  HP: %stat6%/%stat6a%
echo "Thanks for drinking! You sure love it! Good luck, Marisa. See ya!"
if %climb%==yes goto youkaimountainclimb
goto youkaimountain
:Suikatalkno
echo.
echo "Just don't worry, Marisa. It shouldn't make you badly drunk.
echo Anyway, See ya and good luck!"
if %climb%==yes goto youkaimountainclimb
goto youkaimountain

:alicetalk
echo.
echo "Uh! Marisa, it is an ordinary day in Gensokyo, no incidents yet.
echo I'm making another Shanghai here. Nothing much important for now.
echo Whatever, you came here. Did you have something to tell me?"
:alicetalka
echo.
set var=BUGFIX
echo What will you say?
echo [1] Where can I find the mushrooms?
echo [2] I forgot who you are.
echo [3] Just to visit you.
set /p var=^>
if "%var%"=="1" goto alicetalk0
if "%var%"=="2" goto alicetalk1
if "%var%"=="3" goto alicetalk2

if %nulcom%==yes ( echo.) & echo That's not an option -daze!
goto alicetalka
:alicetalk0
echo.
echo "Can't you just find it by yourself? Is that difficult?"
echo Just search them in the forest and that's it, you're done."
goto aliceinside
:alicetalk1
echo.
echo "Did you just forgot me today? My name is Alice Margatroid.
echo I can control my dolls freely and use them for Spellcards.
echo I'm your neighbor. I'm not a human! but a Youkai."
goto aliceinside
:alicetalk2
echo.
echo "That's OK, Marisa. Don't care me so much. See you again."
goto aliceinside

:patchoulitalk
echo.
echo "Oh C'mon... Will you stop stealing the books? But anyway, I'm reading the
echo book as normal... If I was free of asthma, I would be able to recite quickly."
goto SDMgreatlibrary

:sanaetalk
echo.
echo "Whoa! Marisa, you can come here easily? Just in case, my name is
echo Sanae Kochiya. The shrine I'm living is mine. It was not in Gensokyo."
goto moriyashrine

:suwakotalk
echo.
echo "Nothing to say... But nice job." (You don't have the pairing with Suwako.)
goto moriyashrine

REM === START OF PRESERVED CODE IN V0.1.3a ===
:win
cls
echo Good job! You got the mushroom! You won!
echo However, it would be boring without travelling somewhere (If you didn't).
echo Next time, try going somewhere and explore the Text-Based Batch Game!
echo.
echo Play again? [Y/N]
set /p var=Answer: 
if %var%==y goto intro
if %var%==Y goto intro
if %var%==n goto quit
if %var%==N goto quit
goto win
REM ==== END OF PRESERVED CODE IN V0.1.3a ====

:defeat
set /a blood=%blood%-%foeatk%*19
set /a bloodlossadd=(%blooda%-%blood%)/10
set /a bloodloss=99-(%bloodlossadd%*%bloodlossadd%*%bloodlossadd%)/40000
if %bloodloss% LSS 3 goto defeatY
set /a defeat=%defeat%+1
set started=no
echo Marisa was defeated!
echo.
:defeat0
set contime=11
if %nochoice%==no goto defeat0choice
echo You were defeated. You were very exhausted. Some blood was lost.
echo However, you went home later as %foeshort% won and stopped shooting. 
echo Anyway, thanks to ZUN who didn't make Touhou as Blood and Gore. :)
echo.
call :SCORESP
echo    Score  %stat12sp%%stat12%
echo Hi-Score  %stat12hisp%%stat12hi%
echo.
echo Continue? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto defeatcontinue
if /i "%var%"=="n" goto play
goto defeat0
:defeat0choice
if %contime%==0 goto play
set /a contime-=1
echo You were defeated. You were very exhausted. Some blood was lost.
echo However, you went home later as %foeshort% won and stopped shooting.
echo Anyway, thanks to ZUN who didn't make Touhou as Blood and Gore. :)
echo.
call :SCORESP
echo    Score  %stat12sp%%stat12%
echo Hi-Score  %stat12hisp%%stat12hi%
echo.
echo Continue? [Y/N]
echo     %contime%
if %contime%==10 ping localhost -n 2 >nul
choice /t 2 /c yn /d n >nul 2>&1
cls
if errorlevel 2 goto defeat0choice
if errorlevel 1 goto defeatcontinue
:defeatcontinue
set /a stat6=%hp4%-3
set /a stat7=%stat7%-(%foeatk%/2)
set /a stat12=(%stat12%*2/100)*10
if %stat7% LSS 0 set stat7=0
set started=yes
cls
goto marisainside
:defeatY
if %hasnet%==1 start www.youtube.com/watch?v=JgOJb0hmLg8
set started=no
REM Added a song that made you cry when Marisa actually died. :/
REM Beta 1.3.3 Change: Decided not to use the serious music.
:defeatY0
cls
REM Beta 1.3.3 Change: Better not a grave.....
echo You were defeated and Marisa is now fainted.
echo You couldn't control Marisa anymore.
echo ================
echo  DESYNCHRONIZED
echo ================
call :SCORESP
echo Final Score  %stat12sp%%stat12%    Hi-Score  %stat12hisp%%stat12hi%
echo.
echo Don't worry! It means you ran out of Continues.
echo And it's just a game. So, restart the game? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto intro
if /i "%var%"=="n" goto play
goto defeatY0
:defeatX
if %hasnet%==1 start www.youtube.com/watch?v=JgOJb0hmLg8
set started=no
REM Beta 1.5.0 Update: But still, it needs to remain.
:defeatX0
cls
echo You were actually died! Wow...
echo You couldn't control Marisa anymore.
echo ================
echo  DESYNCHRONIZED
echo ================
call :SCORESP
echo Final Score  %stat12sp%%stat12%    Hi-Score  %stat12hisp%%stat12hi%
echo.
echo Don't worry! It means that it is deadly in real life.
echo But, it's just a game! So, restart the game? [Y/N]
set /p var=^>
if /i "%var%"=="y" goto intro
if /i "%var%"=="n" goto play
goto defeatX0
:quit
REM NOTE: This is in a subroutine!
if %started%==no goto quit3
cls
set var2=3
echo You are now exiting the game.
echo [1] Save and quit
echo [2] Quit without saving
echo [3] Cancel
set /p var2=^>
if "%var2%"=="1" goto quitsave
if "%var2%"=="2" goto quitnosave
if "%var2%"=="3" goto :eof
goto quit
:quitsave
set savename=BuGf1X3d
echo.
echo Note: Score won't be saved! (Will be 0 if you load the save.)
set /p savename=Save name: 
if "%savename%"=="BuGf1X3d" goto quitsave0
if exist "%savename%.bat" goto quitsaveover
goto quit2
:quitsaveover
set saveover=n
echo.
echo There is a save game with this name, overwrite? [Y/N]
set /p saveover=^>
if /i "%saveover%"=="y" goto quit2
if /i "%saveover%"=="n" goto quitsave0
goto quitsave0
:quitsave0
echo.
echo [Cancelled]
goto :eof
:quitnosave
echo.
echo Are you really sure? [Y/N]
ping localhost -n 2 >nul
set /p var2=^>
if /i "%var2%"=="y" goto quit3
if /i "%var2%"=="n" goto quitsave0
goto quitsave0
:quit0
if /i %started%==no goto quit3
REM Cleaned up ;D
:quit2
REM Realized foo%bar%>filename, when %bar% is 2 it will be foo2>filename
REM and make the redirection as Error Output redirection!
echo set /a stat0=%stat0% 1>"%savename%.bat"
echo set /a stat0a=%stat0a% >>"%savename%.bat"
echo set /a stat0b=%stat0b% >>"%savename%.bat"
echo set /a stat1=%stat1% >>"%savename%.bat"
echo set /a stat2=%stat2% >>"%savename%.bat"
echo set /a stat3=%stat3% >>"%savename%.bat"
echo set /a stat4=%stat4% >>"%savename%.bat"
echo set /a stat5=%stat5% >>"%savename%.bat"
echo set /a stat6=%stat6% >>"%savename%.bat"
echo set /a stat6a=%stat6a% >>"%savename%.bat"
echo set /a stat7=%stat7% >>"%savename%.bat"
echo set /a stat8=%stat8% >>"%savename%.bat"
echo set /a stat9=%stat9% >>"%savename%.bat"
echo set /a stat10=%stat10% >>"%savename%.bat"
echo set /a stat11=%stat11% >>"%savename%.bat"
echo set /a stat13=%stat13% >>"%savename%.bat"
echo set /a stat14=%stat14% >>"%savename%.bat"
echo set /a stat15=%stat15% >>"%savename%.bat"
echo set /a stat16=%stat16% >>"%savename%.bat"
echo set /a blood=%blood% >>"%savename%.bat"
echo set /a defeat=%defeat% >>"%savename%.bat"
echo set /a mspark=%mspark% >>"%savename%.bat"
echo set /a mony=%mony% >>"%savename%.bat"
echo set /a diff=%diff% >>"%savename%.bat"
echo set /a turnall=%turnall% >>"%savename%.bat"
echo set /a shanghaidefeats=%shanghaidefeats% >>"%savename%.bat"
echo set defeat_youmu=%defeat_youmu%>>"%savename%.bat"
echo set defeat_yuyuko=%defeat_yuyuko%>>"%savename%.bat"
echo set lastplace=%lastplace% >>"%savename%.bat"
if "%climb%"=="yes" echo set /a mount=%mount% >>"%savename%.bat"
REM Set /a will remove the space after a number due to calculation,
REM And Goto will ignore space after the label! No more errors! :D
echo.
echo Saving done.
if /i "%var%"=="save" goto :eof
REM these "quit" routines also used for only saving the game and return to gameplay.


:quit3
goto quit3a
REM Now unused.
cls
color 0E
echo.
echo.
echo.
echo.
echo.
echo       _______   __   __   _______   _______   __   __   _______      __   __
echo      /__  __/\ / /\ / /\ / ___  /\ / ___  /\ / /\ / /\ / _____/\    / /\ / /\
echo      \_/ / _\// /_// / // /\_/ / // /\_/ / // /_//_/ // /\____\/   / /_// / /
echo       / / /  / ___  / // ___  / // / // / // ___/\_\//____  /\    /____  / /
echo      / / /  / /\_/ / // / // / // / // / // /\_/ /\ _\___/ / /    \___/ / /
echo     /_/ /  /_/ //_/ //_/ //_/ //_/ //_/ //_/ //_/ //______/ /        /_/ /
echo     \_\/   \_\/ \_\/ \_\/ \_\/ \_\/ \_\/ \_\/ \_\/ \______\/         \_\/
echo        _______   __        _______   __   __   __   _______   _______   __
echo       / ___  /\ / /\      / ___  /\ / /\ / /\ / /\ / ___  /\ / _____/\ / /\
echo      / /__/ / // / /     / /\_/ / // /_// / // / // /\_/ / // /\____\// / /
echo     / _____/ // / /     / ___  / //____  / // / // / // / // / /__   /_/ /
echo    / /\____\// /_/__   / / // / /_\___/ / // / // / // / // /_// /\ _\_\/
echo   /_/ /     /______/\ /_/ //_/ //______/ //_/ //_/ //_/ //______/ //_/\
echo   \_\/      \______\/ \_\/ \_\/ \______\/ \_\/ \_\/ \_\/ \______\/ \_\/
:quit3loop
set /a nb+=1
for /l %%g in (0,1,1500) do echo Nothing>nul
color 0F
for /l %%g in (0,1,1500) do echo Nothing>nul
color 0E
if %nb% LEQ 10 goto quit3loop
:quit3a
set var3=BUGFIX
set started=no
color 1F
echo.
echo The file exited. Close NitorizingDOS now?
set /p var3=^>
if /i "%var3%"=="y" exit
if /i "%var3%"=="n" goto fakedos0
goto quit3