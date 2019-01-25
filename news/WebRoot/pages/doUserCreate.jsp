<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//获取用户注册数据：用户名，密码，email，爱好
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		String email = request.getParameter("email");
		//获取表单复选框的值
		String[] hobbys = request.getParameterValues("hobby");
	%>
	用户名：
	<%
		if (userName != null && !userName.equals("")) {
			//表单get方式提交，中文乱码处理-治标
			/* byte[] userNames=userName.getBytes("ISO-8859-1");
			userName =new String(userNames,"utf-8"); */
			//userName = new String(userName.getBytes("ISO-8859-1"), "utf-8");
			if(userName.equals("admin")){
				//则注册失败，因为该用户名已经存在，重新跳转回用户注册页面，重新注册
				request.setAttribute("mess", "注册失败！");//在一次请求范围内
				request.getRequestDispatcher("userCreate.jsp").forward(request, response);//转发
			}else{
				//注册成功，跳转回首页
				request.setAttribute("mess", "注册成");
				response.sendRedirect(request.getContextPath()+"/index.jsp");//重定向
				
			}
	%>
	<%=userName%>
	<%
		} else {
			out.println("用户名未填写");
		}
	%><br> 用户密码：<%=passWord%><br> email:<%=email%><br> 爱好：
	<br>
	<%
		//表单post方式提交，中文乱码处理
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		if (hobbys != null && hobbys.length != 0) {
			//用户选择了爱好，将爱好获得
			for (String hobby : hobbys) {
				out.println(hobby + "<br>");
			}	
		} else {
			out.println("您没有选择爱好");
		}
	%><br>
</body>
</html>