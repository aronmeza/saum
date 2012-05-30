<%@ page import="saum.Etapa" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'etapa.label', default: 'Etapa')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
	</head>
	<body>
		<a href="#edit-etapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-etapa" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${etapaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${etapaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${etapaInstance?.id}" />
				<g:hiddenField name="version" value="${etapaInstance?.version}" />
				<g:hiddenField name="receta.id" value="${etapaInstance?.receta?.id}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
                <input id="crear-ingrediente" class="button green rigth" value="${message(code: 'default.button.new.ingrediente', default: 'Nuevo Ingrediente')}" />
                
                <div id="dialog-form-ingrediente" title="Agregar Ingrediente">
                  <g:form method="post" controller="ingrediente" action="save">                    
                  <fieldset class="form">
                    <g:hiddenField name="etapaId" value="${etapaInstance?.id}" />
                    <g:render template="/ingrediente/form"/>
                  </fieldset>
                  <br/>
                  <fieldset class="buttons">
                  
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <input id="cancelar" class="cancel" value="${message(code: 'label.cancelar', default: 'Cancelar')}" />
                  </fieldset>
                  </g:form>
                </div>
        <r:script>
          $(document).ready(function(){
          $( "#dialog-form-ingrediente" ).dialog("close");
          $( "#dialog-form-ingrediente" ).dialog({
          autoOpen: false,
          height: 400,
          width: 650,
          modal: true 
          });
          
          $("#crear-ingrediente").click(function(){
          $( "#dialog-form-ingrediente" ).dialog("open");
        });
          $("#cancelar").click(function(){
          $( "#dialog-form-ingrediente" ).dialog("close");
        });
          
          });
        </r:script>
        </body>
</html>
