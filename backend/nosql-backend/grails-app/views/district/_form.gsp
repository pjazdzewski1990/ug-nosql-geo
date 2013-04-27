<%@ page import="ug.nosql.geo.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="district.data.label" default="Data" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="district.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${districtInstance?.name}" />
</div>

