<%--
  Created by IntelliJ IDEA.
  User: casuser
  Date: 4/7/14
  Time: 3:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain - Sign Up</title>
    <meta name="layout" content="client_main">
</head>

<body>
    <h1>Sign Up!</h1>
    <br>
    <g:hasErrors bean="${user}">
        <ul>
            <g:eachError var="err" bean="${user}">
                <li><g:message error="${err}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <strong>* Required fields</strong>
    <br><br><br>
    <g:form action="createUser">
        <g:hiddenField name="isLoggedIn" value="0"/>
        <table>
            <tr>
                <td><strong>*</strong></td>
                <td>Name:</td>
                <td><g:textField  name="firstName" type="text" value=""/></td>
            </tr>
            <tr>
                <td></td>
                <td>Initial:</td>
                <td><g:textField name="middleInitial" type="text" maxlength="1" value=""/></td>
            </tr>
            <tr>
                <td></td>
                <td>Last Name:</td>
                <td><g:textField name="lastName" type="text" value=""/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Email:</td>
                <td><g:textField  name="userEmail" type="text" value="" /></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>User Name:</td>
                <td><g:textField name="userName" type="text" value=""/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Password:</td>
                <td><g:passwordField name="pw" onchange="checkPasswords()"/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Confirm Password:</td>
                <td><g:passwordField name="conPw" onchange="checkPasswords()"/></td>

            </tr>
        </table>
        <strong name="passwordText"></strong>
        <br><br><br>
        <g:submitButton name="Submit" value="Create Account"/>
    </g:form>
    <br><br><br>
    <a href="index.gsp">Back to Main Page</a>

    <script>
        function checkPasswords()
        {
            if (document.getElementsByName("pw")[0].value == document.getElementsByName("conPw")[0].value){
                document.getElementsByName("passwordText")[0].innerHTML="Passwords Match!";
                document.getElementsByName("passwordText")[0].style.color="green";
            } else {
                document.getElementsByName("passwordText")[0].innerHTML="Passwords Do Not Match!";
                document.getElementsByName("passwordText")[0].style.color="red";
            }

        }
    </script>
</body>
</html>