
<%@ page import="ug.nosql.geo.Community" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'community.label', default: 'Community')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="container">
            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav">
                        <li><a class="home" href="${createLink(uri: '/person')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
            <div id="show-community" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:form class="property-list community">
                    <fieldset>
                
                    <g:if test="${communityInstance?.data}">
                        <label id="data-label" class="property-label"><g:message code="community.data.label" default="Data" /></label>
                        
                            <span class="uneditable-input" aria-labelledby="data-label"><g:fieldValue bean="${communityInstance}" field="data"/></span>
                        
                    </g:if>
                
                    <g:if test="${communityInstance?.name}">
                        <label id="name-label" class="property-label"><g:message code="community.name.label" default="Name" /></label>
                        
                            <span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${communityInstance}" field="name"/></span>
                        
                    </g:if>
                
                    </fieldset>
                    <footer class="form-actions">
                        <g:hiddenField name="id" value="${communityInstance?.id}" />
                        <g:link class="btn btn-primary edit" action="edit" id="${communityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit class="btn delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </footer>
                </g:form>
            </div>
        </div>
	</body>
</html>
