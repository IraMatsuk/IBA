<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Title</title>
    <!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet">
    <style>

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 60px;
            background-color: #f5f5f5;
        }
        .footer .container {
            width: auto;
            max-width: 680px;
            padding: 0 15px;
        }

        h2{
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
        }
        caption {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 16px;
            font-weight: bold;
            caption-side: top;
            text-align: left;
            margin-bottom: 15px;
        }

        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
            background: white;
            max-width: 70%;
            width: 70%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            font-weight: normal;
            color: #ffffff;
            background: #404040;
            padding: 10px 15px;
        }
        td {
            color: #000000;
            border-top: 1px solid #404040;
            padding: 10px 15px;
        }

        tr:nth-child(2n) {
            background: #f2f2f2;
        }

    </style>

</head>
<body>
    <nav role="navigation" class="navbar navbar-default">
        <div class="">
            <img src = "https://www.kv.by/sites/default/files/user7743/logo_iba_group.jpg" width="50" height="50">
        </div>
        <div class="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LoginServlet">Login</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <H2>Добро пожаловать, ${name}</H2>
        <table border="1">
            <caption>Список вашей группы</caption>
            <tr>
                <th>Имя</th>
                <th>Телефон</th>
                <th>Email</th>
            </tr>
            <c:forEach items="${group}" var="person">
                <tr><td>${person.name}</td>
                    <td>${person.phone}</td>
                    <td>${person.email}</td>
                </tr>
            </c:forEach>
        </table>
        <p><font color="red">${errorMessage}</font></p>
        <form method="POST" action="GroupListServlet">
            Добавить новый контакт
            <p> Введите имя <input name="nname" type="text" /> </p>
            <p> Введите телефон <input name="nphone" type="text" /> </p>
            <p> Введите email <input name="nemail" type="text" /> </p>
            <input name="add" value="Добавить" type="submit" />
        </form>
    </div>
    <footer class="footer">
        <div class="container">
            <p>2021 Все права защищены</p>
        </div>
    </footer>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
