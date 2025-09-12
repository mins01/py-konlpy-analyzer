# 한국어 형태소 분석기 관련 py

## 환경
- python3 기반
- pip install konlpy jpype1
- pip install flask

## app.py
- 형태소 분석기용 웹서버 파일 
- 기본 포트 5000 --port 지정으로 변경가능
- 127.0.0.1로 제한함. 외부 접근을 생각한다면 0.0.0.0 으로 app.py 에서 소스 수정 필요.

## start.sh
- 리눅스용 웹서버 실행.
- nohup
- MINGW64 에서도 동작함.

## stop.sh
- 리눅스용 웹서버 정지.

## start.bat
- 윈도우용 테스트 웹서버 실행
- ctrl+c 로 종료.

## analyzers/komoran.py
- 실제 형태소 분석용 파일
- KoNLPy 에서 komoran 을 랩핑해서 제공함.

## analyzers/komoran_user_dic.txt
- komoran 용 사용자 사전.
- 지우지마시오!
- 단어 추가 시 규칙에 맞춰서 넣어줘야함. 단어{tab}타입

