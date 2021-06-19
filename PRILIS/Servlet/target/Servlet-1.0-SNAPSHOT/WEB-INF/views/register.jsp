<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>Title</title>
</head>
<body>
    <div class ="container">
        <section id="content">
            <p><font color="red">${errorRegister}</font></p>
            <form
                    action="${pageContext.servletContext.contextPath}/controller?command=register_new_user" method="POST">
                <h1>New User Registration</h1>
                <div>
                    <input placeholder="Enter your name"
                           required="" name="newLoginName" type="text" />
                </div>
                <div>
                    <input placeholder="Enter password" id ="password" required=""
                           name="newPassword" type="password" />
                </div>
                <div>
                    <input type="submit" value="Register"/>
                </div>
            </form>
        </section>
    </div>
</body>
</html>
