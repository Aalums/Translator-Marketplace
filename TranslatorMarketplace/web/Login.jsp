<%-- 
    Document   : Login
    Created on : Dec 18, 2018, 12:03:23 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");
            if (id_customer == null) {
                //ยังไม่เข้าสู่ระบบ
        %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="index.html">หน้าหลัก</a>
            <a href="Register.jsp">สมัครสมาชิก</a>
            <a href="Login.jsp">เข้าสู่ระบบ</a>
        </div>
    </div>

    <% } else { %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="index.html">หน้าหลัก</a>
            <a href="LogoutServlet">ออกจากระบบ</a>
        </div>
    </div>

    <% }
    %>
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
    </div>
</head>

<body>
    <form action="LoginServlet">
        <!-- Create Container + Logo -->
        <div class="content-wrapper" style="padding-bottom: 699px;">
            <div class="container">
                <div class="login">
                    <div class = "form">
                        <div class = "header">
                            <center><h1>เข้าสู่ระบบ</h1></center>     
                        </div>

                        <div class = "sign-in-form">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <h3>USERNAME</h3><br><br>
                                        <input type="text" name="id" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>PASSWORD</h3><br><br>
                                        <input type="password" name="password" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                <center>
                                    <button type="submit">
                                        <div class = "button-text">
                                            LOGIN
                                        </div>
                                    </button>
                                </center>
                                </td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
