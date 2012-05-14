
<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-receta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-receta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list receta">
			
				<g:if test="${recetaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="receta.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${recetaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.rendimiento}">
				<li class="fieldcontain">
					<span id="rendimiento-label" class="property-label"><g:message code="receta.rendimiento.label" default="Rendimiento" /></span>
					
						<span class="property-value" aria-labelledby="rendimiento-label"><g:fieldValue bean="${recetaInstance}" field="rendimiento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.temperatura}">
				<li class="fieldcontain">
					<span id="temperatura-label" class="property-label"><g:message code="receta.temperatura.label" default="Temperatura" /></span>
					
						<span class="property-value" aria-labelledby="temperatura-label"><g:fieldValue bean="${recetaInstance}" field="temperatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.tiempo}">
				<li class="fieldcontain">
					<span id="tiempo-label" class="property-label"><g:message code="receta.tiempo.label" default="Tiempo" /></span>
					
						<span class="property-value" aria-labelledby="tiempo-label"><g:fieldValue bean="${recetaInstance}" field="tiempo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.porcion}">
				<li class="fieldcontain">
					<span id="porcion-label" class="property-label"><g:message code="receta.porcion.label" default="Porcion" /></span>
					
						<span class="property-value" aria-labelledby="porcion-label"><g:fieldValue bean="${recetaInstance}" field="porcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.textura}">
				<li class="fieldcontain">
					<span id="textura-label" class="property-label"><g:message code="receta.textura.label" default="Textura" /></span>
					
						<span class="property-value" aria-labelledby="textura-label"><g:fieldValue bean="${recetaInstance}" field="textura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.forma}">
				<li class="fieldcontain">
					<span id="forma-label" class="property-label"><g:message code="receta.forma.label" default="Forma" /></span>
					
						<span class="property-value" aria-labelledby="forma-label"><g:fieldValue bean="${recetaInstance}" field="forma"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="receta.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${recetaInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.sabor}">
				<li class="fieldcontain">
					<span id="sabor-label" class="property-label"><g:message code="receta.sabor.label" default="Sabor" /></span>
					
						<span class="property-value" aria-labelledby="sabor-label"><g:fieldValue bean="${recetaInstance}" field="sabor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.calorias}">
				<li class="fieldcontain">
					<span id="calorias-label" class="property-label"><g:message code="receta.calorias.label" default="Calorias" /></span>
					
						<span class="property-value" aria-labelledby="calorias-label"><g:fieldValue bean="${recetaInstance}" field="calorias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.proteinas}">
				<li class="fieldcontain">
					<span id="proteinas-label" class="property-label"><g:message code="receta.proteinas.label" default="Proteinas" /></span>
					
						<span class="property-value" aria-labelledby="proteinas-label"><g:fieldValue bean="${recetaInstance}" field="proteinas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.grasa}">
				<li class="fieldcontain">
					<span id="grasa-label" class="property-label"><g:message code="receta.grasa.label" default="Grasa" /></span>
					
						<span class="property-value" aria-labelledby="grasa-label"><g:fieldValue bean="${recetaInstance}" field="grasa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.carbohidratos}">
				<li class="fieldcontain">
					<span id="carbohidratos-label" class="property-label"><g:message code="receta.carbohidratos.label" default="Carbohidratos" /></span>
					
						<span class="property-value" aria-labelledby="carbohidratos-label"><g:fieldValue bean="${recetaInstance}" field="carbohidratos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.colesterol}">
				<li class="fieldcontain">
					<span id="colesterol-label" class="property-label"><g:message code="receta.colesterol.label" default="Colesterol" /></span>
					
						<span class="property-value" aria-labelledby="colesterol-label"><g:fieldValue bean="${recetaInstance}" field="colesterol"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.sodio}">
				<li class="fieldcontain">
					<span id="sodio-label" class="property-label"><g:message code="receta.sodio.label" default="Sodio" /></span>
					
						<span class="property-value" aria-labelledby="sodio-label"><g:fieldValue bean="${recetaInstance}" field="sodio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.fibra}">
				<li class="fieldcontain">
					<span id="fibra-label" class="property-label"><g:message code="receta.fibra.label" default="Fibra" /></span>
					
						<span class="property-value" aria-labelledby="fibra-label"><g:fieldValue bean="${recetaInstance}" field="fibra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.tipoPlato}">
				<li class="fieldcontain">
					<span id="tipoPlato-label" class="property-label"><g:message code="receta.tipoPlato.label" default="Tipo Plato" /></span>
					
						<span class="property-value" aria-labelledby="tipoPlato-label"><g:fieldValue bean="${recetaInstance}" field="tipoPlato"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recetaInstance?.etapas}">
				<li class="fieldcontain">
					<span id="etapas-label" class="property-label"><g:message code="receta.etapas.label" default="Etapas" /></span>
					
						<g:each in="${recetaInstance.etapas}" var="e">
						<span class="property-value" aria-labelledby="etapas-label"><g:link controller="etapa" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recetaInstance?.id}" />
					<g:link class="edit" action="edit" id="${recetaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
