<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 등록 페이지-->

<jsp:include page="../include/header.jsp"/>

<!-- <div class="container w-50 border shadow-sm p-5 mt-5"> -->
<div class="container w-50 mt-5 p-5 shadow">

<form action="question" method="post">
  
   <h4>1:1문의하기</h4>
   <div class="d-flex justify-content-center">
	   <label for="sel1" class="form-label  m-3">문의유형 선택</label>
	   <select class="form-select w-50 m-3" id="cs_code" name="cs_code">
	      <option></option>
	   </select>
   </div>
   
   <div class="d-flex justify-content-center">
 		  
	   <label class="form-label  m-3">상품 선택</label>
	 
	   <select class="form-select w-50 m-3" id="prod_id" name="prod_id">
	      
	   </select>
   </div>
   
   <input class="form-control" type="text" id="cs_title" name="cs_title" placeholder="제목을 입력하세요" autofocus>      
   
   <textarea class="form-control mt-2" name="cs_con" id="cs_con" rows="5" cols="33" placeholder="내용을 입력하세요"></textarea>
   
   <input class="form-control mt-2" type="text" id="user_id" name="user_id" readonly value="${user_id}">
   
   <div class="text-center mt-3">
      <button class="btn btn-primary">등록</button>   
   </div>
</form>
</div>

					
<script>

$(document).ready(function(){
	  let qaType= "";	
  var codeNum = '500';
  let str = "";
  
  let roleArea = $("#cs_code"); 

   getCommonCode(codeNum, function(data){
   console.log(data);
   
   let list = data;
   let selected = "";
   
   for(let i=1; i<list.length; i++){          
    
       str += " <option value='" + list[i].item_cd+"' "+selected + ">";
      str += list[i].item_nm+"</option>"; 
      
      
      console.log(str);
   
   }
          
   roleArea.html(str);
      
});

});


</script>

<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>