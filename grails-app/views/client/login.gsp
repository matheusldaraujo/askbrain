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
    <meta name="layout" content="client_main">
</head>

<body>
<g:form action="validateCredentials">

    <div class="row">
                <div class="col-md-12 text-center">
                    <h2>User Name: </h2><g:textField style="text-align: center;" placeholder="User name" class=" form-control input-normal "  name="userName"/><br>
                </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>Password: </h2> <g:passwordField style="text-align: center;" placeholder="User name" class=" form-control input-normal " name="pw" type="password" />
        </div>
    </div>
    <div class="row">
            <div class="col-md-12 text-center">
            <g:submitButton class="btn btn-default" name="login" id="${params.id}" value="Login"/><br>
            </div>
     </div>
    </g:form>
</body>
</html>