<%--
  Created by IntelliJ IDEA.
  User: matheus
  Date: 14/04/14
  Time: 3:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
    <!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
    <!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
    <!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.png')}" type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'indexAskBrain.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">

    <g:javascript src="jquery-1.11.0.min.js" />
    <g:javascript src="jquery-ui-1.10.4.min.js" />
    <g:javascript src="askbrain.js" />
    <g:javascript src="bootstrap.min.js" />

    <g:layoutHead/>
    <g:javascript library="application"/>

    <r:layoutResources />
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link class="navbar-brand" action="index">The Ask Brain Project</g:link>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <g:link name="index" action="index">Make your question</g:link>
                </li>
                <g:if test="${!user}">
                <li>
                    <g:link name="loginFrm" action="login">Login</g:link>
                </li>
                <li>
                    <g:link name="signupFrm" action="signup">Create An Account</g:link>
                </li>
                </g:if>
                <g:else>
                    <li>
                        <g:link name="logout" action="logoutUser">Logout</g:link>
                    </li>
                    <li >
                        <g:link name="userProfileFrm" action="userProfile">Profile: See your question</g:link>
                    </li>
                </g:else>

                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
<g:layoutBody/>



<r:layoutResources />
</div>
</body>
</html>
