<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width = device-width" initial-scale = "1">
    <link rel = "stylesheet" href="css/bootstrap.min.css">
    <title>Insert title here</title>
    <style>
        body { padding-top: 20px; }
        table,th,td{
            border: 1px solid #bcbcbc;
            height: 40px;
        }
        table{
            width: 850px;
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
            <li><a href="AboutWapLib.jsp">������ �̿�ȳ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">�α׾ƿ�<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/logout">�α׾ƿ�</a></li>
                    <li><a href="DeleteMember.jsp">ȸ��Ż��</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<%
    request.setCharacterEncoding("utf-8"); // �ѱ۱������� �ٷ�����
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "pass";
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);

    String name = request.getParameter("search-book");

    String sql = "select * from book where name like '%"+name+"%'";
    pstmt=conn.prepareStatement(sql);

    rs=pstmt.executeQuery();
%>

<div class = "container">
    <div class = "col">
        <h3>�˻��ܾ� : <%=name%></h3>
        <div class = "col-md-6">
            <div class="container">
                <table border="1">
                    <tr>
                        <td><input type = "hidden" name = "nothing"></td>
                        <th class="text-center">������ȣ</th>
                        <th class="text-center">å����</th>
                        <th class="text-center">����</th>
                        <th class="text-center">����</th>
                        <th class="text-center">�뿩���ɿ���</th>
                    </tr>
                    <%while(rs.next()){
                        String available = rs.getString("available");
                        String unavail = "1";
                    %>
                    <tr>
                        <form method="post" action="AddToListDB.jsp" accept-charset="UTF-8">
                            <td><input type = "hidden" name = "no"value=<%=rs.getString("no")%>></td>
                            <td align="center"><%=rs.getString("no")%></td>
                            <td align="center"><%=rs.getString("name")%></td>
                            <td align="center"><%=rs.getString("author")%></td>
                            <td align="center"><%=rs.getString("translator")%></td>
                            <%if(!unavail.equals(available)) {%>
                            <td align="center"><input type="submit" value="�뿩�ϱ�"></td>
                            <%} else{%>
                            <td align="center">�뿩�Ұ�</td>
                            <%}%>
                        </form>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
    </div>
</div>

<%
    rs.close();
    pstmt.close();
    conn.close();
%>

<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>