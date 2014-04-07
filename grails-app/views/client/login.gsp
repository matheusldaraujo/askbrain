<%--
  Created by IntelliJ IDEA.
  User: casuser
  Date: 4/7/14
  Time: 3:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain - Login</title>
</head>

<body>
    <h1>Login</h1>
    <g:form>
        User Name: <input name="userName" type="text" /><br>
        Password: <input name="pw" type="password" /><br>
        <g:submitButton name="login"/><br>
    </g:form>
    <a href="signup.gsp">Create an account!</a>
</body>
</html>