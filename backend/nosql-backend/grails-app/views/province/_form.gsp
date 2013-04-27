<%@ page import="ug.nosql.geo.Province" %>



<div class="fieldcontain ${hasErrors(bean: provinceInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="province.data.label" default="Data" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: provinceInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="province.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${provinceInstance?.name}" />
</div>

