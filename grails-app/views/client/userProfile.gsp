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
    <meta name="layout" content="client_main">
</head>

<body>
    <h1>${user.getFirstName()}'s Profile</h1>

    %{--<g:if test="${user.getQuestion().empty}">--}%
        %{--<br>There are no questions for this user.--}%
    %{--</g:if>--}%
    %{--<g:else>--}%
        %{--<table class="table">--}%
            %{--<thead>--}%
            %{--<tr>--}%
                %{--<td>Question</td>--}%
                %{--<td>Answer</td>--}%
            %{--</tr>--}%
            %{--</thead>--}%
            %{--<tbody>--}%
            %{--<g:each var="question" in="${user.getQuestion()}">--}%
                %{--<tr>--}%
                    %{--<td>${question.question}</td>--}%
                    %{--<g:if test="${question.answered != false}">--}%
                        %{--<td>${question.bestMixedAnswer.getMixedAnswer()}</td>--}%
                    %{--</g:if>--}%
                    %{--<g:else>--}%
                        %{--<td>Not answered yet.</td>--}%
                    %{--</g:else>--}%
                %{--</tr>--}%
            %{--</g:each>--}%
            %{--</tbody>--}%
        %{--</table>--}%
    %{--</g:else>--}%
    <br><g:link name="Home" action="index" params="['isLoggedIn':1, 'id':user.getId()]">Home</g:link>
</body>
</html>