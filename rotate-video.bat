@echo off

echo.
echo Rotate Video, http://tpkn.me
echo.

set INPUT_FILE=%~f1
set DIR=%~dp1
set FILENAME=%~n1
set EXT=%~x1

set ROTATION="transpose=1"
set OUTPUT_PREFIX=90cw

echo.
echo Rotate
echo 1. 90 CW (default)
echo 2. 90 CCW
echo 3. 180 CW
CHOICE /T 5 /C 123 /D 1 /N
call goto %ERRORLEVEL%
:1
set OUTPUT_PREFIX=90cw
set ROTATION="transpose=1"
goto rotate
:2
set OUTPUT_PREFIX=90cww
set ROTATION="transpose=2"
goto rotate
:3
set OUTPUT_PREFIX=180cw
set ROTATION="transpose=1,transpose=1"
goto rotate


:rotate
ffmpeg -i "%INPUT_FILE%" -vf %ROTATION% "%DIR%%FILENAME%_%OUTPUT_PREFIX%_%EXT%"


echo.
echo +-----------------------+
echo ^|         DONE          ^|
echo +-----------------------+
timeout /t 2
