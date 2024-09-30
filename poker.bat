::LAST UPDATE 9/16/2023 - Trekka
@echo off
color 03
title Trekkas Video Poker
::WINDOW SIZE
mode 38,12
::HIDE CONSOLE CURSOR
echo.[?25l
:start1
::CHECK IF YOU HAVE A SAVED GAME
if exist "%~dp0\SaveFile.bat" (
    call "%~dp0\SaveFile.bat"
) else (
   echo set /a credit1=1000 > "%~dp0\SaveFile.bat"
   echo set /a gamesPlayed=0 >> "%~dp0\SaveFile.bat"
   call "%~dp0\SaveFile.bat"
)
:next12
setlocal EnableDelayedExpansion
::REWARD/BET VALUES
set /a betz=1
set firstStart=TRUE
::BETS
set /a mainBet=1
set /a lowBet=1
set /a medBet=3
set /a highBet=5
::OTHERS
set /a read1=0
set /a pairz=%mainBet%*1
set /a twopairz=%mainBet%*2
set /a threeofakind=%mainBet%*4
set /a straightreward=%mainBet%*7
set /a flushz=%mainBet%*7
set /a housez=%mainBet%*10
set /a fourofakind=%mainBet%*25
set /a sflush=%mainBet%*50
set /a rflush=%mainBet%*250
::VARIABLES
set readVar=FALSE
set /a gamesPlayedVar=0
set /a round=1
set /a counter1=0
set /a mark5=1
set /a mark4=1
set /a mark3=1
set /a mark2=1
set /a mark1=1
set card1Green=false
set card2Green=false
set card3Green=false
set card4Green=false
set card5Green=false
::FIRST SCREEN ECHOS
:loop3
cls
echo  [97mPair[90m: [0mJ or better[90m - x[0m1 [97mPress "[0m8[97m" to 
echo  [97mTwo pair[90m: --------- x[0m2 [0mshow/hide[0m 
echo  [97mThree of a kind[90m: -- x[0m4 [97mgames played
echo  [97mStraight[90m: --------- x[0m6
echo  [97mFlush[90m: [35m------------ [90mx[0m7
echo  [97mFull house[90m: [35m------- [90mx[0m10
echo  [97mFour of a kind[90m: --- x[0m25
echo  [97mStraight flush[90m: --- x[0m50
echo  [97mRoyal flush[90m: ------ x[0m250[90m
echo.
echo [11;16H[97;7m 0 Next [0m
choice /c 0 > nul
cls
if %readVar% equ TRUE goto THIS1
:next11
if %errorlevel% equ 0 goto loop2
::MAIN SCRIPT STARTS HERE
:loop2
echo [1;2H[97mCredits:[0m^$
echo [1;31H[97mRound:
:loop1
::CLEAR NON LOCKED CARDS OFF THE SCREEN
if %mark1% neq 2 echo [6;3H      
if %mark2% neq 2 echo [6;10H      
if %mark3% neq 2 echo [6;17H      
if %mark4% neq 2 echo [6;24H      
if %mark5% neq 2 echo [6;31H      
::ECHOS
echo [7;2H[90m------------------------------------
echo [8;4H [0m1      2      3      4      5
echo [11;27H [90;7m 9 Bets [0m
echo [10;27H         
echo [4;2H                          
echo [5;2H                                    
echo [11;16H[0m[7;90m 0 Deal [0m
echo [11;3H [7;90m 7 Read [0m
::ECHOS LOW/MED/HIGH ABOVE BET BUTTON DEPENDING ON VARIABLE "betz"
if %betz% equ 1 echo [10;27H [97mLow:[0m1
if %betz% equ 2 echo [10;27H [97mMed:[0m3
if %betz% equ 3 echo [10;27H [97mHigh:[0m5
echo [3;2H                        
::FIX VIUSAL MONEY BUG WHEN CREDITS UNDER 1K and 10k and 100k and 1M
echo [1;11H[0m%credit1% 
echo [1;37H[0m1
if %read1% equ 1 goto next8
if %firstStart% equ TRUE goto next7
::END THE LOOP WHEN 5 CARDS HAVE BEEN DRAWN
if %counter1% equ 5 goto some1
::ROLL A RANDOM NR BETWEEN 1-13 FOR CARDS AND 1-4 FOR SUITS
set /a card=(%RANDOM%*13/32768)+2
set /a suit=(%RANDOM%*4/32768)+1
if %suit% equ 1 set suitset=h
if %suit% equ 2 set suitset=d
if %suit% equ 3 set suitset=c
if %suit% equ 4 set suitset=s
::COUNTER1 GOES UP 1 PER CARD DRAWN EACH LOOP TO DETERMINE WHEN 5 CARDS HAVE BEEN DRAWN
set /a counter1=%counter1%+1
::CARDS VALUES AND VARIABLES
if %card% equ 2 set cardset=2
if %card% equ 3 set cardset=3
if %card% equ 4 set cardset=4
if %card% equ 5 set cardset=5
if %card% equ 6 set cardset=6
if %card% equ 7 set cardset=7
if %card% equ 8 set cardset=8
if %card% equ 9 set cardset=9
if %card% equ 10 set cardset=10
if %card% equ 11 set cardset=J
if %card% equ 12 set cardset=Q
if %card% equ 13 set cardset=K
if %card% equ 14 set cardset=A
::SEND CODE OFF TO EACH LABEL DEPENDING ON COUNTER1 TO SET VARIABLE PER CARD AND TO CHECK IF CARD IS LOCKED
if %counter1% equ 1 goto counterONE
if %counter1% equ 2 goto counterTWO
if %counter1% equ 3 goto counterTHREE
if %counter1% equ 4 goto counterFOUR
if %counter1% equ 5 goto counterFIVE
::DISPLAY
:some1
if %round% equ 1 echo [1;11H[0m%credit1% 
::FIX VIUSAL MONEY BUG WHEN CREDITS UNDER 1K and 10k and 100k and 1M
::PINGING OWN COMPUTER TO CREATE A SMALL PAUSE BETWEEN ECHOS FOR "IMMERSION"
ping -n 2 localhost > nul
set /a playedVAR=0
:some
set /a counter1=0
::LOCKED COLOR
::RESETTING LOCKED CHARACTER
if %mark5% geq 3 set /a mark5=1 && echo [6;31H 
if %mark4% geq 3 set /a mark4=1 && echo [6;24H 
if %mark3% geq 3 set /a mark3=1 && echo [6;17H 
if %mark2% geq 3 set /a mark2=1 && echo [6;10H 
if %mark1% geq 3 set /a mark1=1 && echo [6;3H 
if %gamesPlayedVar% geq 2 set /a gamesPlayedVar=0 && echo [9;2H                         
::MAIN ECHOS
echo.
if %mark5% neq 2 echo [6;32H[90m[[0m%hand5%[90m] 
if %mark4% neq 2 echo [6;25H[90m[[0m%hand4%[90m] 
if %mark3% neq 2 echo [6;18H[90m[[0m%hand3%[90m] 
if %mark2% neq 2 echo [6;11H[90m[[0m%hand2%[90m] 
if %mark1% neq 2 echo [6;4H[90m[[0m%hand1%[90m] 
echo [11;16H[0m[97;7m 0 Deal [0m
if %round% equ 2 goto eval
echo [4;2H[97mLOCK CARD(S)[0m
::LOCK AND DEAL
:nowhere
set /a playedVAR=1
choice /c 1234567890 > nul
if %errorlevel% equ 9 goto nowhere
if %errorlevel% equ 8 echo [9;2H[97mGames:[0m%gamesPlayed% && set /a gamesPlayedVar=%gamesPlayedVar%+1 && goto some
if %errorlevel% equ 7 goto nowhere
if %errorlevel% equ 6 goto nowhere
if %errorlevel% equ 5 echo [0m[6;32H[7;97m[%hand5%][0m && set /a mark5=%mark5%+1 && goto some
if %errorlevel% equ 4 echo [0m[6;25H[7;97m[%hand4%][0m && set /a mark4=%mark4%+1 && goto some
if %errorlevel% equ 3 echo [0m[6;18H[7;97m[%hand3%][0m && set /a mark3=%mark3%+1 && goto some
if %errorlevel% equ 2 echo [0m[6;11H[7;97m[%hand2%][0m && set /a mark2=%mark2%+1 && goto some
if %errorlevel% equ 1 echo [0m[6;4H[7;97m[%hand1%][0m && set /a mark1=%mark1%+1 && goto some
if %errorlevel% equ 0 goto next4
:next4
set /a round=%round%+1
echo [11;16H[0m[7;90m 0 Deal [0m
goto loop1
::SET CARD VARIABLES AND CHECK IF LOCKED (MARKED)
::CARD 1
:counterONE
if %mark1% equ 2 goto loop1
set hand=%cardset%%suitset%
if %round% equ 1 set Prehand1=%cardset%%suitset%
if %round% equ 2 if %hand% equ %Prehand1% set /a counter1=0 && goto loop1
if %round% equ 2 if %hand% equ %Prehand2% set /a counter1=0 && goto loop1
if %round% equ 2 if %hand% equ %Prehand3% set /a counter1=0 && goto loop1
if %round% equ 2 if %hand% equ %Prehand4% set /a counter1=0 && goto loop1
if %round% equ 2 if %hand% equ %Prehand5% set /a counter1=0 && goto loop1
set hand1=%cardset%%suitset%
if %hand1% equ %hand2% set /a counter1=0 && goto loop1
if %hand1% equ %hand3% set /a counter1=0 && goto loop1
if %hand1% equ %hand4% set /a counter1=0 && goto loop1
if %hand1% equ %hand5% set /a counter1=0 && goto loop1
set cardset1=%cardset%
set suitset1=%suitset%
goto loop1
::CARD 2
:counterTWO
if %mark2% equ 2 goto loop1
set hand=%cardset%%suitset%
if %round% equ 1 set Prehand2=%cardset%%suitset%
if %round% equ 2 if %hand% equ %Prehand1% set /a counter1=1 && goto loop1
if %round% equ 2 if %hand% equ %Prehand2% set /a counter1=1 && goto loop1
if %round% equ 2 if %hand% equ %Prehand3% set /a counter1=1 && goto loop1
if %round% equ 2 if %hand% equ %Prehand4% set /a counter1=1 && goto loop1
if %round% equ 2 if %hand% equ %Prehand5% set /a counter1=1 && goto loop1
set hand2=%cardset%%suitset%
if %hand2% equ %hand1% set /a counter1=1 && goto loop1
if %hand2% equ %hand3% set /a counter1=1 && goto loop1
if %hand2% equ %hand4% set /a counter1=1 && goto loop1
if %hand2% equ %hand5% set /a counter1=1 && goto loop1
set cardset2=%cardset%
set suitset2=%suitset%
goto loop1
::CARD 3
:counterTHREE
if %mark3% equ 2 goto loop1
set hand=%cardset%%suitset%
if %round% equ 1 set Prehand3=%cardset%%suitset%
if %round% equ 2 if %hand% equ %Prehand1% set /a counter1=2 && goto loop1
if %round% equ 2 if %hand% equ %Prehand2% set /a counter1=2 && goto loop1
if %round% equ 2 if %hand% equ %Prehand3% set /a counter1=2 && goto loop1
if %round% equ 2 if %hand% equ %Prehand4% set /a counter1=2 && goto loop1
if %round% equ 2 if %hand% equ %Prehand5% set /a counter1=2 && goto loop1
set hand3=%cardset%%suitset%
if %hand3% equ %hand1% set /a counter1=2 && goto loop1
if %hand3% equ %hand2% set /a counter1=2 && goto loop1
if %hand3% equ %hand4% set /a counter1=2 && goto loop1
if %hand3% equ %hand5% set /a counter1=2 && goto loop1
set cardset3=%cardset%
set suitset3=%suitset%
goto loop1
::CARD 4
:counterFOUR
if %mark4% equ 2 goto loop1
set hand=%cardset%%suitset%
if %round% equ 1 set Prehand4=%cardset%%suitset%
if %round% equ 2 if %hand% equ %Prehand1% set /a counter1=3 && goto loop1
if %round% equ 2 if %hand% equ %Prehand2% set /a counter1=3 && goto loop1
if %round% equ 2 if %hand% equ %Prehand3% set /a counter1=3 && goto loop1
if %round% equ 2 if %hand% equ %Prehand4% set /a counter1=3 && goto loop1
if %round% equ 2 if %hand% equ %Prehand5% set /a counter1=3 && goto loop1
set hand4=%cardset%%suitset%
if %hand4% equ %hand1% set /a counter1=3 && goto loop1
if %hand4% equ %hand2% set /a counter1=3 && goto loop1
if %hand4% equ %hand3% set /a counter1=3 && goto loop1
if %hand4% equ %hand5% set /a counter1=3 && goto loop1
set cardset4=%cardset%
set suitset4=%suitset%
goto loop1
::CARD 5
:counterFIVE
if %mark5% equ 2 goto loop1
set hand=%cardset%%suitset%
if %round% equ 1 set Prehand5=%cardset%%suitset%
if %round% equ 2 if %hand% equ %Prehand1% set /a counter1=4 && goto loop1
if %round% equ 2 if %hand% equ %Prehand2% set /a counter1=4 && goto loop1
if %round% equ 2 if %hand% equ %Prehand3% set /a counter1=4 && goto loop1
if %round% equ 2 if %hand% equ %Prehand4% set /a counter1=4 && goto loop1
if %round% equ 2 if %hand% equ %Prehand5% set /a counter1=4 && goto loop1
set hand5=%cardset%%suitset%
if %hand5% equ %hand1% set /a counter1=4 && goto loop1
if %hand5% equ %hand2% set /a counter1=4 && goto loop1
if %hand5% equ %hand3% set /a counter1=4 && goto loop1
if %hand5% equ %hand4% set /a counter1=4 && goto loop1
set cardset5=%cardset%
set suitset5=%suitset%
goto loop1
::EVALUATE OUTCOME OF HAND
:eval
goto values
::SUMMARY
:next6
::LOCKED CARDS
if %card1Green% equ true echo [6;4H[97m[[0m%hand1%[97m][0m 
if %card2Green% equ true echo [6;11H[97m[[0m%hand2%[97m][0m 
if %card3Green% equ true echo [6;18H[97m[[0m%hand3%[97m][0m 
if %card4Green% equ true echo [6;25H[97m[[0m%hand4%[97m][0m 
if %card5Green% equ true echo [6;32H[97m[[0m%hand5%[97m][0m 
::GRAY CARDS
if %card1Green% neq true echo [6;4H[90m[[0m%hand1%[90m]  
if %card2Green% neq true echo [6;11H[90m[[0m%hand2%[90m] 
if %card3Green% neq true echo [6;18H[90m[[0m%hand3%[90m] 
if %card4Green% neq true echo [6;25H[90m[[0m%hand4%[90m] 
if %card5Green% neq true echo [6;32H[90m[[0m%hand5%[90m] 
::MARKED CARDS
if %mark1% equ 2 echo [6;4H[97;7m[%hand1%][0m 
if %mark2% equ 2 echo [6;11H[97;7m[%hand2%][0m 
if %mark3% equ 2 echo [6;18H[97;7m[%hand3%][0m 
if %mark4% equ 2 echo [6;25H[97;7m[%hand4%][0m 
if %mark5% equ 2 echo [6;32H[97;7m[%hand5%][0m 
::MAKING SURE THE ">" STAYS FOR THE LOCKED CARDS
set /a gamesPlayed=%gamesPlayed%+1
echo set /a credit1=%credit1% > "%~dp0\SaveFile.bat"
echo set /a gamesPlayed=%gamesPlayed% >> "%~dp0\SaveFile.bat"
echo set readVar=TRUE >> "%~dp0\SaveFile.bat"
if %readVar% equ FALSE call "%~dp0\SaveFile.bat"
:next7
:next8
if %credit1% leq 0 timeout /t 3 /nobreak > nul && goto lost
set firstStart=FALSE
echo [11;4H[97;7m 7 Read [0m
::FIX VIUSAL MONEY BUG WHEN CREDITS UNDER 1K and 10k and 100k and 1M
::ECHO REPLACES
if %gamesPlayedVar% gtr 0 echo [9;2H[97mGames:[0m%gamesPlayed%
echo [1;11H[0m%credit1% 
echo [4;2H[97mPLACE BET[0m
echo [11;28H[97;7m 9 Bets [0m
echo [11;16H[97;7m 0 Deal [0m
echo [1;37H[0m%round%
::BETSIZE CYCLE VARIABLE VALUE
if %betz% geq 4 set /a betz=1
:some2
if %gamesPlayedVar% geq 2 set /a gamesPlayedVar=0 && echo [9;2H                         
::MENU CHOICES FOR BETSIZE SWITCH AND SAVE
choice /c 1234567890 > nul
if %errorlevel% equ 9 goto bets%betz%
if %errorlevel% equ 8 echo [9;2H[97mGames:[0m%gamesPlayed% && set /a gamesPlayedVar=%gamesPlayedVar%+1 && goto some2
if %errorlevel% equ 7 set /a read1=1 && goto loop3
if %errorlevel% equ 6 goto next7
if %errorlevel% equ 5 goto next7
if %errorlevel% equ 4 goto next7
if %errorlevel% equ 3 goto next7
if %errorlevel% equ 2 goto next7
if %errorlevel% equ 1 goto next7
if %errorlevel% equ 0 goto next5
:next5
::RESETTING VARIABLE VALUES TO NORMAL FROM ITS LOOPED VALUES
set /a read1=0
set /a round=1
set /a counter1=0
set /a mark1=1
set /a mark2=1
set /a mark3=1
set /a mark4=1
set /a mark5=1
set hand=reset
set hand1=reset1
set hand2=reset2
set hand3=reset3
set hand4=reset4
set hand5=reset5
set Prehand1=Prereset1
set Prehand2=Prereset2
set Prehand3=Prereset3
set Prehand4=Prereset4
set Prehand5=Prereset5
set card1Green=false
set card2Green=false
set card3Green=false
set card4Green=false
set card5Green=false
:next10
if %round% equ 1 set /a credit1=%credit1%-%mainBet%
goto loop1
:values
::CALCULATE HAND AND ITS VALUE
::IFS
::GIVING CARDS VALUES INSTEAD OF ITS VARIABLE
if %cardset1% equ J set /a cardset1=11
if %cardset1% equ Q set /a cardset1=12
if %cardset1% equ K set /a cardset1=13
if %cardset1% equ A set /a cardset1=14
if %cardset2% equ J set /a cardset2=11
if %cardset2% equ Q set /a cardset2=12
if %cardset2% equ K set /a cardset2=13
if %cardset2% equ A set /a cardset2=14
if %cardset3% equ J set /a cardset3=11
if %cardset3% equ Q set /a cardset3=12
if %cardset3% equ K set /a cardset3=13
if %cardset3% equ A set /a cardset3=14
if %cardset4% equ J set /a cardset4=11
if %cardset4% equ Q set /a cardset4=12
if %cardset4% equ K set /a cardset4=13
if %cardset4% equ A set /a cardset4=14
if %cardset5% equ J set /a cardset5=11
if %cardset5% equ Q set /a cardset5=12
if %cardset5% equ K set /a cardset5=13
if %cardset5% equ A set /a cardset5=14
::STRAIGHT
if %cardset1% equ %cardset2% goto flusher
if %cardset1% equ %cardset3% goto flusher
if %cardset1% equ %cardset4% goto flusher
if %cardset1% equ %cardset5% goto flusher
if %cardset2% equ %cardset3% goto flusher
if %cardset2% equ %cardset4% goto flusher
if %cardset2% equ %cardset5% goto flusher
if %cardset3% equ %cardset4% goto flusher
if %cardset3% equ %cardset5% goto flusher
if %cardset4% equ %cardset5% goto flusher
set /a straight1=1
set /a straight2=1
set /a straight3=1
set /a straight4=1
set /a straight5=1
set twoexists=0
if %cardset1% equ 2 set /a twoexists=1
if %cardset2% equ 2 set /a twoexists=1
if %cardset3% equ 2 set /a twoexists=1
if %cardset4% equ 2 set /a twoexists=1
if %cardset5% equ 2 set /a twoexists=1
if %twoexists% equ 1 if %cardset1% equ 14 set cardset1=1
if %twoexists% equ 1 if %cardset2% equ 14 set cardset2=1
if %twoexists% equ 1 if %cardset3% equ 14 set cardset3=1
if %twoexists% equ 1 if %cardset4% equ 14 set cardset4=1
if %twoexists% equ 1 if %cardset5% equ 14 set cardset5=1
::CARDSET1
if %cardset1% gtr %cardset2% set /a straight1=%straight1%+1
if %cardset1% gtr %cardset3% set /a straight1=%straight1%+1
if %cardset1% gtr %cardset4% set /a straight1=%straight1%+1
if %cardset1% gtr %cardset5% set /a straight1=%straight1%+1
set cardet%straight1%=%cardset1%
::CARDSET2
if %cardset2% gtr %cardset1% set /a straight2=%straight2%+1
if %cardset2% gtr %cardset3% set /a straight2=%straight2%+1
if %cardset2% gtr %cardset4% set /a straight2=%straight2%+1
if %cardset2% gtr %cardset5% set /a straight2=%straight2%+1
set cardet%straight2%=%cardset2%
::CARDSET3
if %cardset3% gtr %cardset1% set /a straight3=%straight3%+1
if %cardset3% gtr %cardset2% set /a straight3=%straight3%+1
if %cardset3% gtr %cardset4% set /a straight3=%straight3%+1
if %cardset3% gtr %cardset5% set /a straight3=%straight3%+1
set cardet%straight3%=%cardset3%
::CARDSET4
if %cardset4% gtr %cardset1% set /a straight4=%straight4%+1
if %cardset4% gtr %cardset2% set /a straight4=%straight4%+1
if %cardset4% gtr %cardset3% set /a straight4=%straight4%+1
if %cardset4% gtr %cardset5% set /a straight4=%straight4%+1
set cardet%straight4%=%cardset4%
::CARDSET5
if %cardset5% gtr %cardset1% set /a straight5=%straight5%+1
if %cardset5% gtr %cardset2% set /a straight5=%straight5%+1
if %cardset5% gtr %cardset3% set /a straight5=%straight5%+1
if %cardset5% gtr %cardset4% set /a straight5=%straight5%+1
set cardet%straight5%=%cardset5%
set /a cardzet5=%cardet5%+1
set /a cardzet4=%cardet4%+2
set /a cardzet3=%cardet3%+3
set /a cardzet2=%cardet2%+4
set /a cardzet1=%cardet1%+5
::STRAIGHT CHECK
set /a straightmath=%cardset1%+%cardset2%+%cardset3%+%cardset4%+%cardset5%
if %suitset1% equ %suitset2% if %suitset1% equ %suitset3% if %suitset1% equ %suitset4% if %suitset1% equ %suitset5% if %cardzet5% equ %cardzet4% if %cardzet5% equ %cardzet3% if %cardzet5% equ %cardzet2% if %cardzet5% equ %cardzet1% if %straightmath% gtr 55 set /a credit1=%credit1%+%rflush% && echo [3;2H[97mROYAL FLUSH [0m+^$%rflush% && set winloss1=[3;2H[97mROYAL FLUSH [0m+^$%rflush% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %suitset1% equ %suitset2% if %suitset1% equ %suitset3% if %suitset1% equ %suitset4% if %suitset1% equ %suitset5% if %cardzet5% equ %cardzet4% if %cardzet5% equ %cardzet3% if %cardzet5% equ %cardzet2% if %cardzet5% equ %cardzet1% set /a credit1=%credit1%+%sflush% && echo [3;2H[97mSTRAIGHT FLUSH [0m+^$%sflush% && set winloss1=[3;2H[97mSTRAIGHT FLUSH [0m+^$%sflush% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardzet5% equ %cardzet4% if %cardzet5% equ %cardzet3% if %cardzet5% equ %cardzet2% if %cardzet5% equ %cardzet1% set /a credit1=%credit1%+%straightreward% && echo [3;2H[97mSTRAIGHT [0m+^$%straightreward% && set winloss1=[3;2H[97mSTRAIGHT [0m+^$%straightreward% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
::FLUSH
:flusher
if %suitset1% equ %suitset2% if %suitset1% equ %suitset3% if %suitset1% equ %suitset4% if %suitset1% equ %suitset5% set /a credit1=%credit1%+%flushz% && echo [3;2H[97mFLUSH [0m+^$%flushz% && set winloss1=[3;2H[97mFLUSH [0m+^$%flushz% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
::FULL HOUSE
if %cardset1% equ %cardset2% if %cardset3% equ %cardset4% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset2% equ %cardset4% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset4% if %cardset2% equ %cardset3% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset5% if %cardset2% equ %cardset3% if %cardset2% equ %cardset4% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset1% equ %cardset4% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset4% if %cardset1% equ %cardset3% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset5% if %cardset1% equ %cardset3% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset5% if %cardset1% equ %cardset3% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset4% if %cardset1% equ %cardset2% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset5% if %cardset1% equ %cardset2% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset4% equ %cardset5% if %cardset1% equ %cardset2% if %cardset1% equ %cardset3% set /a credit1=%credit1%+%housez% && echo [3;2H[97mFULL HOUSE [0m+^$%housez% && set winloss1=[3;2H[97mFULL HOUSE [0m+^$%housez% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
::FOUR
if %cardset1% equ %cardset2% if %cardset1% equ %cardset3% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%fourofakind% && echo [3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set winloss1=[3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset1% equ %cardset3% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%fourofakind% && echo [3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set winloss1=[3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set card1Green=true && set card2Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset1% equ %cardset4% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%fourofakind% && echo [3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set winloss1=[3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set card1Green=true && set card2Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset1% equ %cardset4% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%fourofakind% && echo [3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set winloss1=[3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set card1Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset2% equ %cardset4% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%fourofakind% && echo [3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set winloss1=[3;2H[97mFOUR OF A KIND [0m+^$%fourofakind% && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
::TWO PAIR
if %cardset1% equ %cardset2% if %cardset3% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card2Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card2Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset4% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card2Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset4% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset2% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card3Green=true && set card2Green=true && set card4Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card3Green=true && set card2Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset4% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card4Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset4% if %cardset3% equ %cardset2% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card4Green=true && set card3Green=true && set card2Green=true && goto next6
if %cardset1% equ %cardset5% if %cardset4% equ %cardset2% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card5Green=true && set card4Green=true && set card2Green=true && goto next6
if %cardset1% equ %cardset5% if %cardset3% equ %cardset2% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card1Green=true && set card5Green=true && set card3Green=true && set card2Green=true && goto next6
if %cardset2% equ %cardset1% if %cardset3% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card1Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset2% equ %cardset1% if %cardset4% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card1Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset4% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card3Green=true && set card1Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset4% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card4Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset4% if %cardset3% equ %cardset1% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card4Green=true && set card3Green=true && set card1Green=true && goto next6
if %cardset2% equ %cardset5% if %cardset3% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card5Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset2% equ %cardset5% if %cardset4% equ %cardset1% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card2Green=true && set card5Green=true && set card4Green=true && set card1Green=true && goto next6
if %cardset3% equ %cardset1% if %cardset2% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card1Green=true && set card2Green=true && set card4Green=true && goto next6
if %cardset3% equ %cardset1% if %cardset4% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card1Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset1% if %cardset2% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card1Green=true && set card2Green=true && set card4Green=true && goto next6
if %cardset3% equ %cardset1% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card1Green=true && set card2Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset2% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card2Green=true && set card1Green=true && set card4Green=true && goto next6
if %cardset3% equ %cardset2% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card2Green=true && set card1Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset2% if %cardset5% equ %cardset4% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card3Green=true && set card2Green=true && set card5Green=true && set card4Green=true && goto next6
if %cardset4% equ %cardset1% if %cardset2% equ %cardset3% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card1Green=true && set card2Green=true && set card3Green=true && goto next6
if %cardset4% equ %cardset2% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card2Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset4% equ %cardset5% if %cardset1% equ %cardset2% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card5Green=true && set card1Green=true && set card2Green=true && goto next6
if %cardset4% equ %cardset5% if %cardset1% equ %cardset3% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card5Green=true && set card1Green=true && set card3Green=true && goto next6
if %cardset4% equ %cardset3% if %cardset1% equ %cardset2% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card3Green=true && set card1Green=true && set card2Green=true && goto next6
if %cardset4% equ %cardset3% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card3Green=true && set card1Green=true && set card5Green=true && goto next6
if %cardset4% equ %cardset3% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card3Green=true && set card2Green=true && set card5Green=true && goto next6
if %cardset4% equ %cardset5% if %cardset2% equ %cardset1% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card5Green=true && set card2Green=true && set card1Green=true && goto next6
if %cardset4% equ %cardset5% if %cardset2% equ %cardset3% set /a credit1=%credit1%+%twopairz% && echo [3;2H[97mTWO PAIR [0m+^$%twopairz% && set winloss1=[3;2H[97mTWO PAIR [0m+^$%twopairz% && set card4Green=true && set card5Green=true && set card2Green=true && set card3Green=true && goto next6
::THREE
if %cardset1% equ %cardset2% if %cardset1% equ %cardset3% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card2Green=true && set card3Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card2Green=true && set card4Green=true && goto next6
if %cardset1% equ %cardset2% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card2Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset1% equ %cardset4% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset1% equ %cardset3% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset1% equ %cardset4% if %cardset1% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card1Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset2% equ %cardset4% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card2Green=true && set card3Green=true && set card4Green=true && goto next6
if %cardset2% equ %cardset3% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card2Green=true && set card3Green=true && set card5Green=true && goto next6
if %cardset2% equ %cardset4% if %cardset2% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card2Green=true && set card4Green=true && set card5Green=true && goto next6
if %cardset3% equ %cardset4% if %cardset3% equ %cardset5% set /a credit1=%credit1%+%threeofakind% && echo [3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set winloss1=[3;2H[97mTHREE OF A KIND [0m+^$%threeofakind% && set card3Green=true && set card4Green=true && set card5Green=true && goto next6
::PAIRS
set /a pair1=%cardset1%+%cardset2%
set /a pair2=%cardset1%+%cardset3%
set /a pair3=%cardset1%+%cardset4%
set /a pair4=%cardset1%+%cardset5%
set /a pair5=%cardset2%+%cardset3%
set /a pair6=%cardset2%+%cardset4%
set /a pair7=%cardset2%+%cardset5%
set /a pair8=%cardset3%+%cardset4%
set /a pair9=%cardset3%+%cardset5%
set /a pair10=%cardset4%+%cardset5%
if %cardset1% equ %cardset2% if %pair1% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card1Green=true && set card2Green=true && goto next6
if %cardset1% equ %cardset3% if %pair2% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card1Green=true && set card3Green=true &&  goto next6
if %cardset1% equ %cardset4% if %pair3% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card1Green=true && set card4Green=true &&  goto next6
if %cardset1% equ %cardset5% if %pair4% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card1Green=true && set card5Green=true &&  goto next6
if %cardset2% equ %cardset3% if %pair5% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card2Green=true && set card3Green=true &&  goto next6
if %cardset2% equ %cardset4% if %pair6% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card2Green=true && set card4Green=true &&  goto next6
if %cardset2% equ %cardset5% if %pair7% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card2Green=true && set card5Green=true &&  goto next6
if %cardset3% equ %cardset4% if %pair8% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card3Green=true && set card4Green=true &&  goto next6
if %cardset3% equ %cardset5% if %pair9% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card3Green=true && set card5Green=true &&  goto next6
if %cardset4% equ %cardset5% if %pair10% geq 22 set /a credit1=%credit1%+%pairz% && echo [3;2H[97mPAIR [0m+^$%pairz% && set winloss1=[3;2H[97mPAIR [0m+^$%pairz% && set card4Green=true && set card5Green=true &&  goto next6
::ROUND LOST
set winloss1=[3;2H[91;7mYOU LOSE[0m
echo [3;2H[91;7mYOU LOSE[0m
echo [4;2H[97mPLACE BET[0m
goto next6
::SETTING BETSIZE AND VALUES
::MED
:bets1
echo [10;27H         
echo [10;27H [97mMed:[0m3
set /a betz=%betz%+1
set /a mainBet=%medBet%
set /a pairz=%mainBet%*1
set /a twopairz=%mainBet%*2
set /a threeofakind=%mainBet%*4
set /a straightreward=%mainBet%*6
set /a flushz=%mainBet%*7
set /a housez=%mainBet%*10
set /a fourofakind=%mainBet%*25
set /a sflush=%mainBet%*50
set /a rflush=%mainBet%*250
goto next7
::HIGH
:bets2
echo [10;27H         
echo [10;27H [97mHigh:[0m5
set /a betz=%betz%+1
set /a mainBet=%highBet%
set /a pairz=%mainBet%*1
set /a twopairz=%mainBet%*2
set /a threeofakind=%mainBet%*4
set /a straightreward=%mainBet%*6
set /a flushz=%mainBet%*7
set /a housez=%mainBet%*10
set /a fourofakind=%mainBet%*25
set /a sflush=%mainBet%*50
set /a rflush=%mainBet%*250
goto next7
::LOW
:bets3
echo [10;27H         
echo [10;27H [97mLow:[0m1
set /a betz=%betz%+1
set /a mainBet=%lowBet%
set /a pairz=%mainBet%*1
set /a twopairz=%mainBet%*2
set /a threeofakind=%mainBet%*4
set /a straightreward=%mainBet%*6
set /a flushz=%mainBet%*7
set /a housez=%mainBet%*10
set /a fourofakind=%mainBet%*25
set /a sflush=%mainBet%*50
set /a rflush=%mainBet%*250
goto next7
::THING
:THIS1
cls
if %betz% equ 1 echo [10;27H [97mLow:[0m1
if %betz% equ 2 echo [10;27H [97mMed:[0m3
if %betz% equ 3 echo [10;27H [97mHigh:[0m5
echo [1;2H[97mCredits:[0m^$
echo [1;31H[97mRound:
echo [1;11H[0m%credit1% 
echo [1;37H[0m%round%
echo [3;2H                        
echo %winloss1%
echo.
::NOT MARKED
if %mark5% neq 2 echo [6;32H[90m[[0m%hand5%[90m] 
if %mark4% neq 2 echo [6;25H[90m[[0m%hand4%[90m] 
if %mark3% neq 2 echo [6;18H[90m[[0m%hand3%[90m] 
if %mark2% neq 2 echo [6;11H[90m[[0m%hand2%[90m] 
if %mark1% neq 2 echo [6;4H[90m[[0m%hand1%[90m] 
::LOCKED CARDS
if %card1Green% equ true echo [6;4H[97m[[0m%hand1%[97m][0m 
if %card2Green% equ true echo [6;11H[97m[[0m%hand2%[97m][0m 
if %card3Green% equ true echo [6;18H[97m[[0m%hand3%[97m][0m 
if %card4Green% equ true echo [6;25H[97m[[0m%hand4%[97m][0m 
if %card5Green% equ true echo [6;32H[97m[[0m%hand5%[97m][0m 
::GRAY CARDS
if %card1Green% neq true echo [6;4H[90m[[0m%hand1%[90m]  
if %card2Green% neq true echo [6;11H[90m[[0m%hand2%[90m] 
if %card3Green% neq true echo [6;18H[90m[[0m%hand3%[90m] 
if %card4Green% neq true echo [6;25H[90m[[0m%hand4%[90m] 
if %card5Green% neq true echo [6;32H[90m[[0m%hand5%[90m] 
::MARKED CARDS
if %mark1% equ 2 echo [6;4H[97;7m[%hand1%][0m 
if %mark2% equ 2 echo [6;11H[97;7m[%hand2%][0m 
if %mark3% equ 2 echo [6;18H[97;7m[%hand3%][0m 
if %mark4% equ 2 echo [6;25H[97;7m[%hand4%][0m 
if %mark5% equ 2 echo [6;32H[97;7m[%hand5%][0m 
echo [7;2H[90m------------------------------------
echo [8;4H [0m1      2      3      4      5
if %gamesPlayedVar% gtr 0 echo [9;2H[97mGames:[0m%gamesPlayed%
echo [1;11H[0m%credit1% 
echo [4;2H[97mPLACE BET[0m
echo [11;28H[97;7m 9 Bets [0m
echo [11;16H[0m[7m 0 Deal [0m
if %gamesPlayedVar% geq 2 set /a gamesPlayedVar=0 && echo [9;2H                         
goto next8
::WHEN YOU RUN OUT OF CREDITS LMAO LOSER
:lost
del /q "%~dp0\SaveFile.bat" > nul
cls
echo.
echo.
echo.
echo  [0m[91mYou have lost all your money.
echo  Time to go back home to your family.
echo  LOSER.[0m
timeout /t 3 /nobreak > nul
pause > nul
exit
