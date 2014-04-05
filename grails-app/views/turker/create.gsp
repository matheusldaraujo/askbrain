<%@ page import="askbrain.Question" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'question.label', default: 'FirstQuestion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'indexAskBrain.css')}" type="text/css">
</head>
<body>
<a href="#create-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-question" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${questionInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${questionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    %{--ASK BRAIN--}%
    <div id="container">
        <h4>Please answer this question:</h4>
        <br/>
        <h2 class="question">${question.getQuestion()}</h2>


        <g:form action="save">
                <g:textField name="answer" />
                <g:hiddenField name="question_id" value="${question.getId()}" />
                <g:submitButton name="Submit" />
        </g:form>
    </div>


</div>
</body>
</html>
