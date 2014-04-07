
<%@ page import="edu.msu.mi.gwurk.Workflow; edu.msu.mi.gwurk.Credentials;" contentType="text/html;charset=UTF-8" %>

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
    <div id="container" class="center">
        <h1>Please just give a grade to each answer for this question:</h1>
        <br/>
        <h2 class="question">${question.getQuestion()}</h2>


        <g:form action="save">



            <g:each var="mixedAnswer" in="${mixedAnswers}">
                <div class="gradeAnswerDiv" >Answer: <span class="gradeAnswerText">${mixedAnswer.getMixedAnswer()}</span></div>
               <div class="ratioInputs">
                <div><g:radio name="grade_${mixedAnswer.getId()}" value="5" /> Excelente</div>
                <div><g:radio name="grade_${mixedAnswer.getId()}" value="4" /> Acceptable</div>
                <div><g:radio name="grade_${mixedAnswer.getId()}" value="3" /> Medium</div>
                <div><g:radio name="grade_${mixedAnswer.getId()}" value="2" /> Poor</div>
                <div><g:radio name="grade_${mixedAnswer.getId()}" value="1" /> Trash</div>
               </div>
            </g:each>



            <g:hiddenField name="question_id" value="${question.getId()}" />
            <g:submitButton name="Submit" />
        </g:form>
    </div>


</div>
</body>
</html>
