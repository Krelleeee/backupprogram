@echo off 
title Automated Backup

rem First directory selection
	:Start
	cls
	Echo Backup Program at your service,
	Echo Which directory would you like to backup?
	Echo Please use full path, ie. C:\Windows\System32
	Set /p firstdir=
	IF "%firstdir%"=="" GOTO Error
	IF NOT EXIST %firstdir% GOTO Error
	Echo.

rem Second Directory Selection
	Echo You have selected %firstdir%,
	Echo Please enter the full path you want to copy to
	Set /p secdir=
	IF "%secdir%"=="" GOTO Error
	IF NOT EXIST %secdir% GOTO Createdir
	If EXIST %secdir% GOTO Copy
	Echo.

rem Creating directory
	:Createdir
	Echo The directory %secdir% does not exist.
	Echo Would you like to create it? (y/n + return)
	Set /p createdir=
	IF "%createdir%" == "n" GOTO Start
	IF "%createdir%" == "y" mkdir %secdir%
	IF "%createdir%"== "" GOTO Error
	IF NOT EXIST %newdir% GOTO Error
	IF EXIST %newdir% GOTO Copy
	Echo.
	GOTO Error

	
rem Copy
	:Copy
	Echo Copying %firstdir%
	Echo to %secdir%...
	rem xcopy %firstdir% [%secdir%] /l /s /e /t 
	Echo Copy Complete
	Echo.
	GOTO End
	

rem Incase of error 
	:Error
	Echo The program has encounted an error.
	Echo Please check inputs and try again.
	Echo Press any key to continue
	pause>nul
	Echo.
	GOTO Start


rem End
	:End
	Echo Would you like to copy anything else? (y/n +_return)
	Set /p end=
	If "$end$" == "" GOTO Error
	IF "%end%" == "y" GOTO Start
	IF "%end%" == "n" Exit