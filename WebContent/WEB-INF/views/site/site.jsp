<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>site</title>
<link
   href="${pageContext.request.contextPath}/content/site/css/reset.css"
   type="text/css" rel="stylesheet" />
<link
   href="${pageContext.request.contextPath}/content/site/css/site.css"
   type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Aqua/content/home/js/menu-icon.js">
   
</script>


<script>
   window.onload = function() {
     
      
      var add = document.querySelectorAll("#btnadd");    
      var content = document.querySelectorAll(".content");
      
       
       for(var i=0; i<add.length; i++ ){
          add[i].onclick=function(event){
              /* for (var j = 0; j < add.length; j++) {
                 
                 add[j].removeChild(add[j].lastChild); 
                                
              }  */
              
              
         var dlg = document.createElement("div");     
         var div = document.querySelector("#top");
         var txt = document.createTextNode("물고기 사이트!!!!!");
         div.appendChild(txt);    
         var div2 = document.querySelector("#middle");
         var txt = document.createTextNode("이곳은 정말 쩌는 물고기 싸이트입니다 일단한번 들어와보시죠 커몬");
         div2.appendChild(txt);    
         var div3 = document.querySelector("#bottom");
         var iframe = document.createElement("iframe");
         iframe.style.width = "735px";
         iframe.style.height="268px";
   
          
         iframe.src ="http://www.daum.net";
         div3.appendChild(iframe);
         
         
         var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					dlg.innerHTML = request.responseText;
				}
			};
			request.open("GET", "site", true);
			request.send(null);
              
          }       
      }    
      
      /* var sClick = function(event) {
  		
 		 /*------번호 선택스타일변경---------------------------*/
 	      /*var ul = event.target.parentNode.parentNode; 
 		 var as = ul.querySelectorAll("a");
 		 for(var i=0; i<as.length;i)
 	     as[i].className="";*/  
 	     
 	     event.target.className = "content";
 		 
 		 /*------선택된 번호의 게시글 변경---------------------------*/
 		var page = event.target.innerText;
 		//------------------------------------------------------
         var request = new XMLHttpRequest();
   
 		
 		//페이지 넘기기 
 		request.onreadystatechange = function(){
 			if(request.readyState == 4){
 				//Tbody 안쪽방 비우기
 				var tbody = document.querySelectorAll(".content")
 				tbody.innerHTML = request.responseText;
 				
 				//alert(request.responseText);
 			};
 		};
 		page++;
 		request.open("GET","site?pg=" +page+"&f="+param.f+"&q="+param.q,true);
 		request.send(null);
 		
 		
 		//---------------------------------------------------------
 		
 		return false;
 	}; 
       
      
     
      
      
      
      
      
      var tab = document.querySelector("#tab");

      tab.onclick = function() {

         var dlg = document.createElement("div");
         dlg.style.width = "400px";
         dlg.style.height = "400px";
         dlg.style.position = "fixed";
         dlg.style.background = "white";
         dlg.style.bottom = "180px";
         dlg.style.right = "90px";
         document.body.appendChild(dlg);
         var request = new XMLHttpRequest();
         request.onreadystatechange = function() {
            if (request.readyState == 4) {
               dlg.innerHTML = request.responseText;
            }
         };
         request.open("GET", "menuPartial", true);
         request.send(null);

         var body = document.querySelector("#abody");
         body.onclick = function() {
            closeDialog(dlg);
         }

         event.stopPropagation();
         return false;
      };
      var closeDialog = function(dlg) {
         document.body.removeChild(dlg);
      };
   
</script>
</head>
<body id="abody">
   <div id="beta"></div>
   <header></header>
   <div id="body">
      <div id="left-body">
         <div id="menu"></div>
         <a href="home"><div id="home"></div></a>
         <c:if test="${pageContext.request.userPrincipal == null}">
            <a href="login"><div id="login"></div></a>
         </c:if>
         <c:if test="${pageContext.request.userPrincipal != null}">
            <c:url var="logout" value="/j_spring_security_logout" />
            <a href="${logout}">
               <div id="logout"></div>
            </a>
         </c:if>
         <security:authorize ifAnyGranted="ROLE_ADMIN">
            <a href="membersmanager"><div id="my"></div></a>
         </security:authorize>
         <security:authorize ifAnyGranted="ROLE_USER">
            <a href="mypage"><div id="my"></div></a>
         </security:authorize>
      </div>

      <div id="center-body">
         <div id="ws"></div>
         <div id="container">
            <div id="left">

               <div id="top" class="contant" > <li class="aaa">${s.spic}</li></div>


               <div id="middle" class="contant"></div>


               <div id="bottom" class="contant"></div>

            </div>
            <div id="scroll">
               <div id="right">
                  <c:forEach var="s" items="${list}">
                     <ul>
                        <li class="aaa"><input id="btnadd" type="button"
                           value="텍스트와 이미지추가" />${s.spic1}</li>
                     </ul>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>


      <div id="right-body">
         <div id="tab"></div>
      </div>
   </div>
   <footer> <a href="Menu"><div id="left-footer"></div></a>
   <div id="center-footer">
      <small>Copyright © 2015 AQUA ESU ALL Rights Reserved</small>
   </div>
   <div id="right-footer"></div>
   </footer>
</body>
</html>