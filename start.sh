#!/bin/bash

# 기본 포트 설정 (첫 번째 인자로 전달, 없으면 5000)
PORT=${1:-5000}

# 로그 파일 및 PID 파일 경로
LOG_FILE="flask_app_${PORT}.log"
PID_FILE="flask_app_${PORT}.pid"

# 이미 PID 파일이 있으면 서버가 실행 중인지 확인
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p $PID > /dev/null 2>&1; then
        echo "Flask 서버가 이미 실행 중입니다. PID=$PID"
        exit 0
    else
        echo "PID 파일은 존재하지만 프로세스가 없습니다. 삭제합니다."
        rm "$PID_FILE"
    fi
fi

# Flask 서버 백그라운드 실행
echo "Flask 서버 시작 (포트 $PORT)..."
echo "=== Flask server start: $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$LOG_FILE"
nohup python3 app.py --port $PORT >> "$LOG_FILE" 2>&1 &

# PID 기록
echo $! > "$PID_FILE"
echo "Flask 서버가 시작되었습니다. PID=$! 로그: $LOG_FILE"