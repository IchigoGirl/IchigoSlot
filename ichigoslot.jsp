<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.Optional" %>

<%
// ファイル名
String[] luckArray = { "ichigo", "akane", "7" };

// 0以上3未満の整数（0,1,2）を乱数で生成
int index1 = (int) (Math.random() * 3);
String luck1 = luckArray[index1];
int index2 = (int) (Math.random() * 3);
String luck2 = luckArray[index2];
int index3 = (int) (Math.random() * 3);
String luck3 = luckArray[index3];
%>

<%
request.setCharacterEncoding("UTF-8");
String address = request.getParameter("address");
%>


<%
System.out.println(address);
String param="symbol-cli transaction transfer --recipient-address " + address + " --mosaics 3A8416DB2D53B6C8::15000000 --message ProcessExe --max-fee 2000000 --profile alice --password YourPassowrd --mode normal --announce > result.txt";
System.out.println(param);
ProcessBuilder p = new ProcessBuilder("cmd", "/c" , param); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍓いちごスロット🍓</title>
</head>
<body>
<img src="<%= luck1 %>.png">
<img src="<%= luck2 %>.png">
<img src="<%= luck3 %>.png"><BR>
あなたのアドレス(Your Address) <%=address %>
<% if( luck1.equals("7")&& luck2.equals("7") && luck3.equals("7") ) { %>
<% Process process = p.start(); %>
<p> 🍓15XYM送金しました🍓(Send 15XYM)</p>
<% } %>
<p> <input type="button" value="もう一度" onclick="window.location.reload();"/> </p>
</body>
</html>
