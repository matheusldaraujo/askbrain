
<%@ page import="gturkplugintester.Demographics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'demographics.label', default: 'Demographics')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-demographics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-demographics" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list demographics">
			
				<g:if test="${demographicsInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="demographics.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${demographicsInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${demographicsInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="demographics.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${demographicsInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${demographicsInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="demographics.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${demographicsInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${demographicsInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="demographics.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${demographicsInstance}" field="language"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:demographicsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${demographicsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
