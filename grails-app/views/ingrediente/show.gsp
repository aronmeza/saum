
<%@ page import="saum.Ingrediente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ingrediente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ingrediente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ingrediente">
			
				<g:if test="${ingredienteInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="ingrediente.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${ingredienteInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredienteInstance?.unidadMedida}">
				<li class="fieldcontain">
					<span id="unidadMedida-label" class="property-label"><g:message code="ingrediente.unidadMedida.label" default="Unidad Medida" /></span>
					
						<span class="property-value" aria-labelledby="unidadMedida-label"><g:fieldValue bean="${ingredienteInstance}" field="unidadMedida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredienteInstance?.presentacion}">
				<li class="fieldcontain">
					<span id="presentacion-label" class="property-label"><g:message code="ingrediente.presentacion.label" default="Presentacion" /></span>
					
						<span class="property-value" aria-labelledby="presentacion-label"><g:fieldValue bean="${ingredienteInstance}" field="presentacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredienteInstance?.etapa}">
				<li class="fieldcontain">
					<span id="etapa-label" class="property-label"><g:message code="ingrediente.etapa.label" default="Etapa" /></span>
					
						<span class="property-value" aria-labelledby="etapa-label"><g:link controller="etapa" action="show" id="${ingredienteInstance?.etapa?.id}">${ingredienteInstance?.etapa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredienteInstance?.materia}">
				<li class="fieldcontain">
					<span id="materia-label" class="property-label"><g:message code="ingrediente.materia.label" default="Materia" /></span>
					
						<span class="property-value" aria-labelledby="materia-label"><g:link controller="materiaPrima" action="show" id="${ingredienteInstance?.materia?.id}">${ingredienteInstance?.materia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ingredienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${ingredienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
