<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!--qnxmtmxmfoq 5 외부 라이브러리 설정-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery 외부라이브러리 설정 -->
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link
   href="${pageContext.request.contextPath}/resources/css/board/questionBoard.css"
   rel="stylesheet">

<!-- 사용자 정의 자바스크립트 -->
<script>
   
</script>
<title>게시판</title>

</head>
<body class="pt-5">
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <div id="board_write">
      <div class="pathLink">
         <a style="color:black" href="${pageContext.request.contextPath}/">홈</a> > 
         <a style="color:black"
            href="${pageContext.request.contextPath}/FAQ">문의 게시판</a>
      </div>

      <h2>1:1 문의</h2>
      <div id="questionForm">
         <form enctype="multipart/form-data" action="#" method="post">
            <div>
               <span>제목</span>
               <input name="qtitle" id="qtitle" required></input>
            </div>
            <div>
               <span>작성자</span> 
               <input name="qwriter" id="qwriter" required></input>
            </div>
            <div style="margin-bottom: 1.5rem">
               <label for="category">분류</label> 
               <select id="category" style="margin-left: 30px; height:30px;">
                  <option value="product">상품문의</option>
                  <option value="delivery">배송문의</option>
                  <option value="return">반품/교환 문의</option>
                  <option value="etc">기타문의</option>
               </select>
            </div>
            <div>

               <input name="user-content" id="user-content"></input>
            </div>

            <p>첨부 파일1 <input type="file" name="SelectFile1" /></p>
            <p> 첨부 파일2 <input type="file" name="SelectFile2" /></p>
            <p>첨부 파일3 <input type="file" name="SelectFile3" /></p>
   
               <button class="btn_submit btn btn-dark btn-md " type="submit">글 작성</button>
            
         </form>
      </div>
   </div>
</body>
</html>