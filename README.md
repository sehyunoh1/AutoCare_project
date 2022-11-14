# AutoCare_project
#### AUTO_Car project
### 2022/11/11

기획 의도 
- 자동차 정비예약 이나 상담을 통합 온라인 상에서 할 수 있는 서비스가 존재하지 않음
- 국내 자동차와 수입 자동차를 아울러서 예약/상담을 진행
- 공식 서비스센터 뿐만 아닌 사설 공업사도 추천
- 경정비와 중정비, 사고수리 구분


벤치마킹

- 현대 블루핸즈 예약 홈페이지
- 기아 오토큐 예약 홈페이지
- 닥터 차 홈페이지(https://doctor-cha.com/)

주요 기능

1. 회원가입
   - 입력 항목
     - 이름,이메일,비밀번호,핸드폰,주소,차량모델,차량 연식
2. 로그인
   - 모든 기능은 로그인을 해야 수행 가능.
3. 예약
   - 차종은 로그인 세션에 저장된 정보로 가져옴
   - 정비 카테고리 입력 : 경정비,소음/진단/사고 수리
   - 세부 정비 항목 입력 : 카테고리에 따라 다름
     - 정비 카테고리 부터 세부 내용은 select로 고름(세부정비항목이 기타인 경우 100자 이내로 서술) 
   - 서비스센터 선택
   - 딜리버리 서비스 여부 선택
   - 날짜 및 시간 선택
   - 예약 완료(세션에 저장된 회원 정보를 같이 저장)
4. 질문 게시판
   - 사업소 추천,예상 견적 문의하는 게시판
   - 파일첨부 가능
5. 마이페이지
   - 회원 정보(이름,차량,전화번호) 수정가능
   - 회원 탈퇴
6. 관리자 페이지
   - 회원 목록 조회
     - 회원 삭제
   - 질문 게시판 조회 및 댓글로 답변 가능
   

※ 추가 하고 싶은 기능 
   - 임시 견적 (예상 견적가)
   - 정비 카테고리에 따라 항목이 나뉘어짐
