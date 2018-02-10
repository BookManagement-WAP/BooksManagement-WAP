<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="model.dao.BookDao" %>
<%@ page import="model.dto.BookDto" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width = device-width" initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Insert title here</title>
    <style>
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/index">WAP ������</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="BookSearchForm.jsp">�ڷ� �˻�</a></li>
            <li><a href="Service.jsp">������ ����</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">�� ����</a>
                <ul class="dropdown-menu">
                    <li><a href="/get-new-info">������������</a></li>
                    <li><a href="BorrowingExtensionReservation.jsp">����/����/����</a></li>
                </ul>
            </li>
            <li><a href="bbs.jsp">������ �̿�ȳ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">�����ϱ�<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="Login.jsp">�α���</a></li>
                    <li><a href="JoinInForm.jsp">ȸ������</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<%
    request.setCharacterEncoding("utf-8");
    BookDao bookDao = BookDao.getInstance();
    ArrayList<BookDto> bookDtoArr = (ArrayList<BookDto>) request.getAttribute("search-book");
    for(BookDto b : bookDtoArr){
        out.println(b.getNo());
        out.println(b.getName());
        out.println(b.getBigField());
        out.println(b.getSmField());
        out.println(b.getAuthor());
        out.println(b.getAvailable());
    }
//    System.out.println(bookDtoArr);
    out.println(bookDtoArr);
%>
</table>
</body>
</html>