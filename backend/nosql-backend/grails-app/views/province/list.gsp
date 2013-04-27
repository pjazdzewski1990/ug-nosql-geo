
<%@ page import="ug.nosql.geo.Province" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'province.label', default: 'Province')}" />
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
            <div id="list-province" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="data" title="${message(code: 'province.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'province.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${provinceInstanceList}" status="i" var="provinceInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                            <td><g:link action="show" id="${provinceInstance.id}">${fieldValue(bean: provinceInstance, field: "data")}</g:link></td>
                        
                            <td>${fieldValue(bean: provinceInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
                    <g:paginate total="${provinceInstanceTotal}" />
                </div>
            </div>
        </div>
	</body>
</html>
