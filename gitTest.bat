@echo off
cls

chcp 65001>nul
title NumberGame
color 0F

set /a attempt=0
set /a maxval=16
set /a minval=1
set /a number=%random% * (%maxval% - %minval% + 1) / 32768 + %minval%

:loop
cls
set /p user=[%attempt%]Number:
set /a attempt=%attempt% + 1

if %attempt% gtr 5 (
	if %user% neq %number% (
		cls
		echo You lose!
		pause>nul
		goto :end
	)
)
if %user% == %number% (
	cls
	echo You Win! Num is:[%number%] Attempts:[%attempt%]
	goto :end
) else if %user% lss %number% (
	echo GTR!
	pause>nul
	goto :loop
) else if %user% gtr %number% (
	echo LSS!
	pause>nul
	goto :loop
)
:end

pause>nul
cls
exit
