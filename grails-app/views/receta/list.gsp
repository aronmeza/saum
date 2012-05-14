
<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-receta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-receta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'receta.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="rendimiento" title="${message(code: 'receta.rendimiento.label', default: 'Rendimiento')}" />
					
						<g:sortableColumn property="temperatura" title="${message(code: 'receta.temperatura.label', default: 'Temperatura')}" />
					
						<g:sortableColumn property="tiempo" title="${message(code: 'receta.tiempo.label', default: 'Tiempo')}" />
					
						<g:sortableColumn property="porcion" title="${message(code: 'receta.porcion.label', default: 'Porcion')}" />
					
						<g:sortableColumn property="textura" title="${message(code: 'receta.textura.label', default: 'Textura')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recetaInstanceList}" status="i" var="recetaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recetaInstance.id}">${fieldValue(bean: recetaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: recetaInstance, field: "rendimiento")}</td>
					
						<td>${fieldValue(bean: recetaInstance, field: "temperatura")}</td>
					
						<td>${fieldValue(bean: recetaInstance, field: "tiempo")}</td>
					
						<td>${fieldValue(bean: recetaInstance, field: "porcion")}</td>
					
						<td>${fieldValue(bean: recetaInstance, field: "textura")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recetaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
