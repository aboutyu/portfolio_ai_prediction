from rest_framework.views import APIView  # 반드시 이것을 import 해야 함
from rest_framework.response import Response
from rest_framework import status

class Sample(APIView):  # (중요) APIView 상속 확인
    # 1. GET 요청 처리 (브라우저 접속 테스트용)
    def get(self, request):
        return Response({"message": "GET 요청 성공! 데이터를 보려면 POST를 사용하세요."}, status=status.HTTP_200_OK)

    # 2. POST 요청 처리 (데이터 전송용)
    def post(self, request):
        input_contents = request.data.get('contents')
        response_data = {
            "sample": input_contents
        }
        return Response(response_data, status=status.HTTP_200_OK)