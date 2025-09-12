@echo off
REM -------------------------------
REM Flask server start (test only)
REM -------------------------------

REM Set port (default: 5000)
SET PORT=5000
IF NOT "%1"=="" SET PORT=%1

REM Run Flask server
python app.py --port %PORT%