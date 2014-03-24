
<%@ page import="gturkplugintester.Demographics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'demographics.label', default: 'Demographics')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-demographics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-demographics" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="age" title="${message(code: 'demographics.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'demographics.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'demographics.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="language" title="${message(code: 'demographics.language.label', default: 'Language')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${demographicsInstanceList}" status="i" var="demographicsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${demographicsInstance.id}">${fieldValue(bean: demographicsInstance, field: "age")}</g:link></td>
					
						<td>${fieldValue(bean: demographicsInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: demographicsInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: demographicsInstance, field: "language")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${demographicsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
