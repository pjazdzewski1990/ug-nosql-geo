<%@ page import="ug.nosql.geo.Community" %>



<div class="fieldcontain ${hasErrors(bean: communityInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="community.data.label" default="Data" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: communityInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="community.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${communityInstance?.name}" />
</div>

