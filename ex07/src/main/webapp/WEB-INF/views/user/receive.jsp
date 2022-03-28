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
<div id = "page">
	<h1>받은메세지함</h1>
	<table>
		<tr>
			<td width=100 class="title">아이디</td>
			<td width=200> ${vo.uid }</td>
			<td width=100 class="title">이름</td>
			<td width=200> ${vo.uname }</td>
			<td width=100 class="title">포인트</td>
			<td width=200 id="point"> ${vo.point }</td>
		</tr>
	</table>
	<!-- 보낸메시지 목록 출력 -->
   <table id="tbl" style="margin-top:20px"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td width=50>No.</td>
         <td width=150>보낸이</td>
         <td width=300>내용</td>
         <td width=200>받은날짜</td>
         <td width=200>읽은날짜</td>
		 <td width=120>메세지확인</td>
      </tr>
      {{#each .}}
      <tr class="row">
         <td class="mno">{{mno}}</td>
         <td>{{uname}} ({{sender}})</td>
         <td><p class="ellipsis message">{{message}}</p></td>
         <td>{{senddate}}</td>
         <td class="readdate">{{display readdate}}</td>
		 <td><button>메세지 확인</button></td>
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
   
   //메세지 확인 버튼 클릭한 경우
   $("#tbl").on("click",".row button",function(){
	   $(".view:visible").each(function(){
		  $(this).hide(); 
	   });
	   var row=$(this).parent().parent();
	   var mno=row.find(".mno").html();
	   $(".view" + mno).show();
	   
	   if(row.find(".readdate").html() != "읽지않음") return;
	   //특정메세지 읽기
	   $.ajax({
		  type: "get",
		  url: "/message/read",
		  data: {mno:mno},
		  success: function(data){
		  		row.find(".readdate").html(data.readdate);
		  		$.ajax({
		  			type: "get",
		  			url: "/user/getPoint",
		  			data: {uid:uid},
		  			success: function(data){
		  				$("#point").html(data);
		  			}
		  		});
		  		
		  }
	   });
   });

   
   function getList(){
      $.ajax({
         type : "get",
         url : "/message/receiveList",
         data: {uid:uid},
         dataType: "json",
         success:function(data){
            var template = Handlebars.compile($("#temp").html());
            $("#tbl").html(template(data));
         }
   });
   }
</script>