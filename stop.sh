#!/bin/bash

# 기본 포트 설정 (첫 번째 인자로 전달, 없으면 5000)
PORT=${1:-5000}

# 로그 파일 및 PID 파일 경로
LOG_FILE="flask_app_${PORT}.log"
PID_FILE="flask_app_${PORT}.pid"

# PID 파일 확인
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p $PID > /dev/null 2>&1; then
        echo "Flask 서버 종료 중... PID=$PID"
        echo "=== Flask server stop: $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$LOG_FILE"
        kill $PID
        rm "$PID_FILE"
        echo "Flask 서버가 종료되었습니다."
    else
        echo "PID 파일은 존재하지만 프로세스가 없습니다. PID 파일 삭제."
        rm "$PID_FILE"
    fi
else
    echo "PID 파일이 없습니다. 서버가 실행 중이 아닌 것 같습니다."
fi