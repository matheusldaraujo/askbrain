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
</head>

<body>
    <h1>Sign Up!</h1>
    <strong>* Required fields</strong>
    <br><br><br>
    <g:form>
        <table>
            <tr>
                <td><strong>*</strong></td>
                <td>Name:</td>
                <td><g:textField  name="firstName" type="text"/></td>
            </tr>
            <tr>
                <td></td>
                <td>Initial:</td>
                <td><g:textField name="middleInitial" type="text" maxlength="1"/></td>
            </tr>
            <tr>
                <td></td>
                <td>Last Name:</td>
                <td><g:textField name="lastInitial" type="text"/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Email:</td>
                <td><g:textField  name="userEmail" type="text"/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>User Name:</td>
                <td><g:textField name="userName" type="text"/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Password:</td>
                <td><g:passwordField name="pw"/></td>
            </tr>
            <tr>
                <td><strong>*</strong></td>
                <td>Confirm Password:</td>
                <td><g:passwordField  name="pwConfirm"/></td>

            </tr>
        </table>
        <g:submitButton name="Submit" value="Create Account"/>
    </g:form>
    <br><br><br>
    <a href="index.gsp">Back to Main Page</a>
</body>
</html>