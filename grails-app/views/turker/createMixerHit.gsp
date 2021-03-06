
<%@ page import="edu.msu.mi.gwurk.Workflow; edu.msu.mi.gwurk.Credentials;" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'question.label', default: 'FirstQuestion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

</head>
<body>
<a href="#create-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="create-question" class="content scaffold-create" role="main">
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
    <div class="col-md-12 jumbotron">
    <div id="container" class="text-center">
        <h3>Please answer this question:</h3>
        <br/>
        <h5>You can search anywhere, even from your mind</h5>
        <div class="btn-toolbar">
        <h2 class="h3">${question.getQuestion()}</h2>

        <g:form action="save">
             <br/><br/>
            <label>Your answer: </label><g:textField class="form-control input-lg" placeholder="Be honest"  name="additionalAnswer" />

            <br/><br/>

            <h2>Please mix your answer with these sentences in blue:</h2>

            <div class="row">

                <g:each var="answer" in="${answers}">
                    <div class="row bg-info">
                        <h3>${answer.getAnswer()}</h3>
                    </div>
                </g:each>

            </div>

            <g:textArea class="input-lg col-lg-12" rows="6" name="mixedAnswer"></g:textArea>

            <div class="row">
            <g:hiddenField name="question_id" value="${question.getId()}" />
            </div>
            <div class="row">
                <br/><br/>
            <g:submitButton  class="btn btn-primary btn-lg"  name="Submit" />
            </div>



            <div id="workflow_data" >
                <g:set var="workflow" value="${Workflow.findByName('Turker Ranker Workflow')}"/>
                <h1>Launch Workflow: ${workflow.name}</h1>
                <p>
                    <b>Description:</b>${workflow.description}
                </p>

                <p>

                    Type of run? <g:select from="${["sandbox","real"]}" name="type" value="sandbox"/> <br/>
                    Iterations?  <g:field name="iterations" type="number" value="1"/><br/>
                    Credentials? <g:select name="credentials" from="${Credentials.list()}" optionKey="id" optionValue="name"/><br/>

                </p>
                <h2>Global Properties</h2>
                <g:render template="/taskPropertiesForm" model="${[prefix:"global",props:workflow.taskProperties]}"/>
                <g:each in="${workflow.allTasks.values()}" var="task">
                    <h2>Task Properties: ${task.name}</h2>
                    <g:render template="/taskPropertiesForm" model="${[prefix:task.name,props:task.taskProperties]}"/>
                </g:each>
                <g:submitButton name="Launch" value="Ask me"/>
                <g:actionSubmit action="index" value="Cancel"/>

            </div>

        </g:form>
    </div>
       </div>


</div>
</body>
</html>
