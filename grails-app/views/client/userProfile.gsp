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


<div class="col-md-4">
    <img src="${resource(dir: 'images', file: 'pink.gif')}">
</div>

<div class="col-md-8 text-center">
<h1>${user.getFirstName()}'s Profile</h1>
<g:if test="${user.getQuestion().empty}">
    <br>There are no questions for this user.
</g:if>

<g:else>

    <table class="table">
        <thead>
        <tr>
            <td> # </td>
            <td>Question</td>
            <td>Answer</td>
        </tr>
        </thead>
        <tbody>

        <g:set var="counter" value="${1}" />

        %{-- TODO: Sort how get questions --}%
        <g:each var="question" in="${user.getQuestion()}">
            <tr class="${ question.finalized ? "bg-success" : ""}">
                <td width="5%">${counter}</td>
                <td width="50%">${question.question}</td>
                <g:if test="${question.answered == true}">
                    <g:if test="${question.mixed == true}">
                        <g:if test="${question.graded == true}">
                            <td>${question.bestMixedAnswer.getMixedAnswer()}</td>
                        </g:if>
                        <g:else>
                            <td>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                        <span class="sr-only">75% Complete</span>
                                    </div>
                                </div>
                            </td>
                        </g:else>
                    </g:if>
                    <g:else>
                        <td>
                            <div class="progress progress-striped active">
                                <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>

                        </td>
                    </g:else>
                </g:if>
                <g:else>
                    <td>
                        <div class="progress">
                            <div class="progress progress-striped active">
                                <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 25%">
                                    <span class="sr-only">25% Complete</span>
                                </div>
                            </div>
                            %{--<div class="progress-bar progress-bar-warning" style="width: 33%">--}%
                                %{--<span class="sr-only">33% Complete (warning)</span>--}%
                            %{--</div>--}%
                            %{--<div class="progress-bar progress-bar-success" style="width: 34%">--}%
                                %{--<span class="sr-only"33% Complete (danger)</span>--}%
                            %{--</div>--}%
                        </div>
                    </td>
                </g:else>
            </tr>
            <g:set var="counter" value="${counter + 1}" />
        </g:each>
        </tbody>
    </table>
    </div>
</g:else>

</body>
</html>