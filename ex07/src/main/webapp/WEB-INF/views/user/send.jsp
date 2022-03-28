<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
   	textarea {
		width:100%; border: none;
	}
	textarea :hover{
		outline: none; border-bottom:1px black solid 
	}
	.message{
		cursor: pointer;
	}
	select {
		width: 300px;
		height: 30px;
		border: 1px solid gray;
	}
	p{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 250px;
	}
	
   </style>
<div id="page">
   <h1>메세지 쓰기</h1>
   <table>
      <tr>
         <td width=100 class="title">아이디</td>
         <td width=200>${vo.uid}</td>
         <td width=100 class="title">이름</td>
         <td width=200>${vo.uname}</td>
         <td width=100 class="title">포인트</td>
         <td width=200 id="point">${vo.point}</td>
      </tr>
      <tr>
      	<td class="title">받는이</td>
			<td colspan=5><select id="receiver">

				<c:forEach items="${list}" var="v">
					<c:if test="${vo.uid != v.uid}">
						<option value="${v.uid }">${v.uname}(${v.uid})</option>
					</c:if>
				</c:forEach>

			</select></td>
		</tr>
      <tr>
         <td colspan=6 style="text-align:right">
            <textarea id="message" rows="5" cols="110" placeholder="내용을 입력하세요"></textarea>
            <button id="btnSend">전송</button>
         </td>
      </tr>
   </table>
   <!-- 보낸메시지 목록 출력 -->
   <h1>보낸메시지함</h1>
   <table id="tbl" style="margin-top:20px"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td width=50>No.</td>
         <td width=150>받은이</td>
         <td width=300>내용</td>
         <td width=200>보낸날짜</td>
         <td width=200>읽은날짜</td>
      </tr>
      {{#each .}}
      <tr class="row">
         <td class="mno">{{mno}}</td>
         <td>{{uname}} ({{receiver}})</td>
         <td><p class="ellipsis message">{{message}}</p></td>
         <td>{{senddate}}</td>
         <td class="readdate">{{display readdate}}</td>
      </tr>
      <tr class="view{{mno}} view" style="display:none">
         <td colspan=5>
            <span style="padding:20px">{{message}}</span>
         </td>
      </tr>
      {{/each}}
   </script>
<script>
   Handlebars.registerHelper("display", function(readdate){
      if(readdate) return readdate;
      else return "읽지않음";
   })
</script>
   
</div>
<script>
   var uid = "${vo.uid}"
   getList();
   
   //전송버튼을 클릭한 경우
   $("#btnSend").on("click",function(){
	   var sender=uid;
	   var receiver=$("#receiver").val();
	   var message=$("#message").val();
	   if(message=="") {
		   alert("보내실 내용을 입력하세요");
		   $("#message").focus();
		   return;
	   }
	   //메세지 전송
	   if(!confirm("내용을 전송하시래요?")) return;
	   $.ajax({
		  type: "post",
		  url: "/message/insert",
		  data: {sender:sender, receiver:receiver, message:message},
		  success: function(){
			 
			  //포인트 읽기
			  $.ajax({
				 type: "get",
				 url: "/user/getPoint",
				 data: {uid:uid},
				 success: function(data){
					 $("#point").html(data);
					 alert("메시지 전송완료");
					  getList();
					  $("#message").val("");
				 }
			  });
		  }
	   });
   });
   
   $("#tbl").on("click", ".row .message", function(e){
	   $("#tbl .view").each(function(){
			$(this).hide();   
	   });
	   
      var row=$(this).parent().parent();
      var mno =row.find(".mno").html();
      $(".view" + mno).show();
   });
   
   function getList(){
      $.ajax({
         type : "get",
         url : "/message/sendList",
         data: {uid:uid},
         dataType: "json",
         success:function(data){
            var template = Handlebars.compile($("#temp").html());
            $("#tbl").html(template(data));
         }
   });
   }
</script>