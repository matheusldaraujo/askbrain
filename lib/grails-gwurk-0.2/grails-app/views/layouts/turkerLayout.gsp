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
<div class="container">
    <div id="grailsLogo" role="banner"><img id="brain_top_img" src="${resource(dir: 'images', file: 'brain.png')}" alt="Grails"/> <span class="titleAskBrain"> Ask Brain </span></div>
    <g:layoutBody/>
    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    <r:layoutResources />
    <g:include controller="javascript" action="turk"/>
</div>
</body>
</html>

