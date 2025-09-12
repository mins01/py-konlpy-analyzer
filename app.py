# app.py

import logging
# from flask import Flask, request, Response, jsonify
from flask import Flask, request, Response
# from analyzers.komoran import analyze_text
from analyzers import analyze_text
import json
import argparse


app = Flask(__name__ , static_url_path="/static", static_folder="public/static")

# werkzeug 로거 비활성화
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)  # ERROR 이하 로그는 무시

@app.route("/analyze", methods=["GET"])
def analyze_api():
    # GET 요청의 query parameter 'text' 읽기
    text = request.args.get("text", "")
    if not text:
        # return jsonify({"error": "The 'text' parameter is required."}), 400
        return Response(
            json.dumps({"message": "The 'text' parameter is required."}, ensure_ascii=False),
            content_type="application/json; charset=utf-8"
        )

    result = analyze_text(text)
    # return jsonify(result)
    return Response(
        json.dumps(result, ensure_ascii=False),
        content_type="application/json; charset=utf-8"
    )

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    # 포트번호 설정용
    parser.add_argument("--port", type=int, default=5000, help="Port to run the server on") 
    args = parser.parse_args()

    # app.run(host="0.0.0.0", port=5000, debug=True);
    # app.run(host="127.0.0.1", port=args.port, debug=True)
    app.run(host="127.0.0.1", port=args.port, debug=False)