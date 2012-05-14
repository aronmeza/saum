
<%@ page import="saum.Ingrediente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ingrediente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ingrediente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'ingrediente.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="unidadMedida" title="${message(code: 'ingrediente.unidadMedida.label', default: 'Unidad Medida')}" />
					
						<g:sortableColumn property="presentacion" title="${message(code: 'ingrediente.presentacion.label', default: 'Presentacion')}" />
					
						<th><g:message code="ingrediente.etapa.label" default="Etapa" /></th>
					
						<th><g:message code="ingrediente.materia.label" default="Materia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ingredienteInstanceList}" status="i" var="ingredienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ingredienteInstance.id}">${fieldValue(bean: ingredienteInstance, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: ingredienteInstance, field: "unidadMedida")}</td>
					
						<td>${fieldValue(bean: ingredienteInstance, field: "presentacion")}</td>
					
						<td>${fieldValue(bean: ingredienteInstance, field: "etapa")}</td>
					
						<td>${fieldValue(bean: ingredienteInstance, field: "materia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ingredienteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
