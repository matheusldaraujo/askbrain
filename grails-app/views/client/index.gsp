<%--
  Created by IntelliJ IDEA.
  User: matheus
  Date: 26/03/14
  Time: 7:04 PM
--%>

<%@ page import="edu.msu.mi.gwurk.Workflow; edu.msu.mi.gwurk.Credentials;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ask Brain</title>
    <meta name="layout" content="client_main">
</head>

<body>
<h1>Hi Client</h1>
<g:form action="begin_question">
    <div>
        <g:hiddenField name="isLoggedIn" value="${params.isLoggedIn}"/>
        <g:if test="${params.isLoggedIn == '0'}">
            <div>
                <g:link name="loginFrm" action="login">Login</g:link>
            </div>
            <div>
                <g:link name="signupFrm" action="signup">Create An Account!</g:link>
            </div>
        </g:if>
        <g:else>
            <g:hiddenField name="id" value="${params.id}"/>
            <div>
                <g:link name="userProfileFrm" id="${params.id}" action="userProfile">Profile</g:link>
                <g:link name="logout" action="logoutUser" params="${params}">Logout</g:link>
            </div>
        </g:else>

    </div>
    <div >
        <h2>Make you Question:</h2>
        <div class="input-group">
            <g:textField class="input-group" id="questionField" name="question"/>
        </div>
    <input type="button" class="btn btn-default" onclick="document.getElementById('Launch').click()" value="Ask me" />


<div id="workflow_data" >
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
<</div>

</div>
</body>
</html>