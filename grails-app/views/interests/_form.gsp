<%@ page import="gturkplugintester.Interests" %>



<div class="fieldcontain ${hasErrors(bean: interestsInstance, field: 'food', 'error')} ">
	<label for="food">
		<g:message code="interests.food.label" default="Food" />
		
	</label>
	<g:textField name="food" value="${interestsInstance?.food}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: interestsInstance, field: 'sport', 'error')} ">
	<label for="sport">
		<g:message code="interests.sport.label" default="Sport" />
		
	</label>
	<g:textField name="sport" value="${interestsInstance?.sport}"/>
</div>



