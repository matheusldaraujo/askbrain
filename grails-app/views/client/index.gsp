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

%{--<g:if test="${!user}">--}%
    %{--<div class="col-md-12 text-center bg-danger">--}%
        %{--<h3 class=" text-danger">Please signup for full support</h3>--}%
    %{--</div>--}%
%{--</g:if>--}%

<g:if test="${user}">
    <div class="col-md-12 text-center bg-info">
        <h4 class=" text-info">You are logged as ${user.getFirstName()} ${user.getLastName()}</h4>
    </div>
</g:if>

<div class="row">
<g:if test="${user}">
    <div style="padding-top: 5%;" class="col-md-6 text-center">
        <h2>Make your question:</h2>

        <g:form action="begin_question">
            <g:textField style="text-align: center;" placeholder="I can answer everything!" class=" form-control input-normal " id="questionField" name="question"/>

            <div style="padding-top: 25px;">
                <input type="button" class="btn btn-primary" onclick="document.getElementById('Launch').click()" value="Ask me" />
            </div>



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
            </div>

        </g:form>
    </div>
    </g:if>
    <g:else>
        <div style="padding-top: 10%;" class="col-md-6">
            <g:link name="register" action="signup" class="btn btn-success btn-block btn-lg"><br/><br/><br/> <span class="h1">Sign up</span><br/><br/><br/></g:link>
        </div>
    </g:else>
    <div class="col-md-6 text-center">
        <img src="${resource(dir: 'images', file: 'brain.png')}">
    </div>
</div>

<div style="padding-top: 50px" class="row">
    <div class="col-md-12">

            <div class="col-md-6">
                <blockquote>
                <p>Gee, Brain, what do you want to do tonight?</p>
                <footer>Pinky</cite></footer>
                </blockquote>
            </div>


            <div class="col-md-6">
                <blockquote>
                <p>The same thing we do every night, Pinky - try to take over the world!</p>
                <footer>Brain</cite></footer>
                </blockquote>
            </div>


    </div>
</div>
</body>
</html>