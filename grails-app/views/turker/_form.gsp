<%@ page import="askbrain.FirstQuestion" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="question.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${questionInstance.age}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="question.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${questionInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="question.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${questionInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="question.language.label" default="Language" />
		
	</label>
	<g:textField name="language" value="${questionInstance?.language}"/>
</div>

