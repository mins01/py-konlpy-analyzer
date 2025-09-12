# py-konlpy-analyzer
konlpy 라이브러리를 사용한 형태소 분석기. 웹서버도 띄울 수 있음.

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

## analyzers/{ETC}.py
- 그 외 형태소 KoNLPy 라이브러리 래핑용

## 테스트
- curl "http://127.0.0.1:5000/analyze?text=%ED%95%9C%EA%B5%AD%EC%96%B4%20%ED%98%95%ED%83%9C%EC%86%8C%20%EB%B6%84%EC%84%9D%EA%B8%B0%EB%A5%BC%20%ED%85%8C%EC%8A%A4%ED%8A%B8%ED%95%A9%EB%8B%88%EB%8B%A4.%20-%20%EC%82%AC%EC%9A%A9%EC%9E%90%EC%B6%94%EA%B0%80%EC%82%AC%EC%A0%84%EB%8B%A8%EC%96%B4%ED%85%8C%EC%8A%A4%ED%8A%B8%EC%9A%A9%EB%8A%94%20%EC%82%AC%EC%9A%A9%EC%9E%90%20%EC%82%AC%EC%A0%84%EC%97%90%20%EC%B6%94%EA%B0%80%EB%90%9C%20%EB%8B%A8%EC%96%B4"
  - 입력: 한국어 형태소 분석기를 테스트합니다. - 사용자추가사전단어테스트용는 사용자 사전에 추가된 단어
  - 출력: {"nouns": ["한국어", "형태소", "분석기", "테스트", "사용자추가사전단어테스트용", "사용자", "사전", "추가", "단어"]}