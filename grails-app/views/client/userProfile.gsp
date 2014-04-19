<%--
  Created by IntelliJ IDEA.
  User: joereeder
  Date: 4/15/14
  Time: 1:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain - User Profile</title>
</head>

<body>
    <strong>${user.userName}'s Profile</strong>
    <g:if test="${user.getQuestion().empty}">
        <br>There are no questions for this user.
    </g:if>
    <g:else>
        <table border="1">
            <tr>
                <td>Question</td>
                <td>Answer</td>
            </tr>
            <g:each var="question" in="${user.getQuestion()}">
                <tr>
                    <td>${question.question}</td>
                    <g:if test="${question.answered != false}">
                        <td>${question.bestMixedAnswer.getMixedAnswer()}</td>
                    </g:if>
                </tr>
            </g:each>
        </table>
    </g:else>
    <br><g:link name="Home" action="index" params="['isLoggedIn':1, 'id':user.getId()]">Home</g:link>
</body>
</html>