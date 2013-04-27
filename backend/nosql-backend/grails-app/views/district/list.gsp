
<%@ page import="ug.nosql.geo.District" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'district.label', default: 'District')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="container">
            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav">
                        <li><a class="home" href="${createLink(uri: '/person')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
            <div id="list-district" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="data" title="${message(code: 'district.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'district.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${districtInstanceList}" status="i" var="districtInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                            <td><g:link action="show" id="${districtInstance.id}">${fieldValue(bean: districtInstance, field: "data")}</g:link></td>
                        
                            <td>${fieldValue(bean: districtInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
                    <g:paginate total="${districtInstanceTotal}" />
                </div>
            </div>
        </div>
	</body>
</html>
