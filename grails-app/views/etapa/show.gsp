
<%@ page import="saum.Etapa" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'etapa.label', default: 'Etapa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-etapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-etapa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list etapa">
			
				<g:if test="${etapaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="etapa.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${etapaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etapaInstance?.procedimiento}">
				<li class="fieldcontain">
					<span id="procedimiento-label" class="property-label"><g:message code="etapa.procedimiento.label" default="Procedimiento" /></span>
					
						<span class="property-value" aria-labelledby="procedimiento-label"><g:fieldValue bean="${etapaInstance}" field="procedimiento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${etapaInstance?.ingredientes}">
				<li class="fieldcontain">
					<span id="ingredientes-label" class="property-label"><g:message code="etapa.ingredientes.label" default="Ingredientes" /></span>
					
						<g:each in="${etapaInstance.ingredientes}" var="i">
						<span class="property-value" aria-labelledby="ingredientes-label"><g:link controller="ingrediente" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${etapaInstance?.receta}">
				<li class="fieldcontain">
					<span id="receta-label" class="property-label"><g:message code="etapa.receta.label" default="Receta" /></span>
					
						<span class="property-value" aria-labelledby="receta-label"><g:link controller="receta" action="show" id="${etapaInstance?.receta?.id}">${etapaInstance?.receta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${etapaInstance?.id}" />
					<g:link class="edit" action="edit" id="${etapaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
