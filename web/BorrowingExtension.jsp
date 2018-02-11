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
            width: 800px;
        }
    </style>
</head>
<body>
<nav class = "navbar navbar-default">
    <div class = "navbar-header">
        <button type="button" class = "navbar-toggle collapsed"
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
                <ul class = "dropdown-menu">
                    <li><a href="/get-new-info">������������</a></li>
                    <li><a href="BorrowingExtensionReservation.jsp">����/����/����</a> </li>
                </ul>
            </li>
            <li><a href="AboutWapLib.jsp">������ �̿�ȳ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="/logout" role="button" aria-haspopup="true" aria-expanded="false">�α׾ƿ�<span class="caret"></span></a>
            </li>
        </ul>
    </div>
</nav>

<div class = "container">
    <div class = "row">

        <div class = "col-md-2">
            <div class="container">
                <h3>����/����/����</h3>
                <div class="row">
                    <div class="col-md-2">
                        <nav class="nav-sidebar">
                            <ul class="nav">
                                <li class="active"><a href="BorrowingExtension.jsp">����/���� ��Ȳ</a></li>
                                <li class=""><a href="Record.jsp">����/�ݳ� ���</a></li>
                                <li class=""><a href="Reservation.jsp">    ����</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
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

            String id = (String)session.getAttribute("id");
            String sql = "select * from list where id like '%"+id+"%'";
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
        %>
        <div class = "col-md-6">
            <div class="container">
                <table border="1">
                    <tr>
                        <td><input type = "hidden" name = "nothing"></td>
                        <th class="text-center">������ȣ</th>
                        <th class="text-center">å����</th>
                        <th class="text-center">�뿩��</th>
                        <th class="text-center">�ݳ�������</th>
                        <th class="text-center">�ݳ��ϱ�</th>
                    </tr>
                    <%while(rs.next()){
                        String returndate = rs.getString("returndate");
                        String notReturn = "null";
                        if(returndate.equals(notReturn)){
                    %>
                    <tr>
                        <form method="post" action="Return.jsp" accept-charset="UTF-8">
                            <td><input type = "hidden" name = "no"value=<%=rs.getString("no")%>></td>
                            <td align="center"><%=rs.getString("no")%></td>
                            <td align="center"><%=rs.getString("name")%></td>
                            <td align="center"><%=rs.getString("outdate")%></td>
                            <td align="center"><%=rs.getString("duedate")%></td>
                            <td align="center"><input type="submit" value = "�ݳ�"></td>
                        </form>
                    </tr>
                    <%}
                    }%>
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