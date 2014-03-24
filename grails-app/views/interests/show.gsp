
<%@ page import="gturkplugintester.Interests" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'interests.label', default: 'Interests')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-interests" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-interests" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list interests">
			
				<g:if test="${interestsInstance?.food}">
				<li class="fieldcontain">
					<span id="food-label" class="property-label"><g:message code="interests.food.label" default="Food" /></span>
					
						<span class="property-value" aria-labelledby="food-label"><g:fieldValue bean="${interestsInstance}" field="food"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${interestsInstance?.sport}">
				<li class="fieldcontain">
					<span id="sport-label" class="property-label"><g:message code="interests.sport.label" default="Sport" /></span>
					
						<span class="property-value" aria-labelledby="sport-label"><g:fieldValue bean="${interestsInstance}" field="sport"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${interestsInstance?.workerId}">
				<li class="fieldcontain">
					<span id="workerId-label" class="property-label"><g:message code="interests.workerId.label" default="Worker Id" /></span>
					
						<span class="property-value" aria-labelledby="workerId-label"><g:fieldValue bean="${interestsInstance}" field="workerId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:interestsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${interestsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
