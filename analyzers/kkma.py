# analyze.py
import os
import sys
# from konlpy.tag import Okt  # Okt = Twitter 형태소 분석기
from konlpy.tag import Kkma

analyze = Kkma()

def analyze_text(text):
    # 형태소 단위 추출
    # morphs = analyze.morphs(text)

    # 명사만 추출
    nouns = analyze.nouns(text)

    # 품사 태깅
    # pos = analyze.pos(text)

    # 결과 출력 (PHP에서 받을 수 있게 JSON 형식)
    result = {
        # "morphs": morphs,
        "nouns": nouns,
        # "pos": pos
    }

    # print(json.dumps(result, ensure_ascii=False))
    # return json.dumps(result, ensure_ascii=False)
    return result

# print(json.dumps(result, ensure_ascii=False))

# CLI에서 호출할 경우
if __name__ == "__main__":
    import json
    if len(sys.argv) < 2:
        print("분석할 문장을 입력하세요.")
        sys.exit(1)
    
    text = sys.argv[1]
    print(json.dumps(analyze_text(text),ensure_ascii=False))