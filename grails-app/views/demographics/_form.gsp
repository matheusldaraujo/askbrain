<%@ page import="gturkplugintester.Demographics" %>



<div class="fieldcontain ${hasErrors(bean: demographicsInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="demographics.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${demographicsInstance.age}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: demographicsInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="demographics.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${demographicsInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demographicsInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="demographics.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${demographicsInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demographicsInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="demographics.language.label" default="Language" />
		
	</label>
	<g:textField name="language" value="${demographicsInstance?.language}"/>
</div>

