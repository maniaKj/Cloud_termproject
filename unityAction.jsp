<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="userUnity" class="user.UserUnity" scope="page"/>
<jsp:setProperty name="userUnity" property ="userID"/>
<jsp:setProperty name="userUnity" property ="gameScore"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href ="css/bootstrap.css">
<title>유니티 post받기</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int gameScore = 0;
		String get_userID = "";
		
		if(request.getParameter("get_userID") != null) {
			get_userID = request.getParameter("bbsID");
		}
		
		if(request.getParameter("gameScore") != null) {
			gameScore = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		UserDAO userDAO = new UserDAO();
		
		if(userUnity.getUserID().equals("asdf")){
			PrintWriter script = response.getWriter();
			script.println("send back Message!!");
		}
		
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		if(userUnity.getUserID().equals("asdf")){
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write("TestUnityToSQL", "master", "congratulation");
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("Write Fail");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("Write Success!!");
			}
		}
		
		if(userUnity.getUserID().equals("1234")){
			BbsDAO bbsDAO = new BbsDAO();
			ArrayList<Bbs> list= bbsDAO.getList(1);
			PrintWriter script = response.getWriter();
			script.println(list.get(0).getBbsID());
			//script.println(asdf);
		}
		//int result = userDAO.login(user.getUserID(), user.getUserPassword());
		/*PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력값은 : ' + userUnity.getGameScore())");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");*/
	
		
	%>
</body>
</html>