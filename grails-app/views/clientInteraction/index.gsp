<%--
  Created by IntelliJ IDEA.
  User: matheus
  Date: 26/03/14
  Time: 7:04 PM
--%>

<%@ page import="askbrain.ClientInteractionController;  edu.msu.mi.turkmdr.Workflow;edu.msu.mi.turkmdr.Credentials;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'indexAskBrain.css')}" type="text/css">
</head>

<body>
<h1>Hi Client</h1>
<div>
    Log in
    <br/>
    Sign up
</div>
<div>
    <g:form action="begin_question">
        <div>
            <g:textField id="questionField" name="question"/>
        </div>
        <div>


        </div>




    <g:set var="workflow" value="${Workflow.first()}"/>
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
    </g:form>


</div>
</body>
</html>