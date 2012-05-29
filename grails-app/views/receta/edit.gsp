<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require module="jquery-ui"/>
	</head>
	<body>
<h1>Editar Receta</h1><hr>

		<div id="edit-receta" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${recetaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${recetaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${recetaInstance?.id}" />
				<g:hiddenField name="version" value="${recetaInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
                <input id="crear-etapa" class="button green rigth" value="${message(code: 'default.button.new.etapa', default: 'Nueva Etapa')}" />
                
                <div id="dialog-form-etapa" title="Agregar Etapa">
                  <p class="validateTips"></p>
                  <form id="formrecetasend" action="/saum/etapa/save"  method="POST" >
                    <g:hiddenField name="idReceta" value="${recetaInstance?.id}" />
                    <fieldset class="dialog">                    
                  <label for="nombre" class="dialog"><g:message code="etapa.nombre.label" default="Nombre"/></label>
                  <input type="text" name="nombreEtapa" id="nombreEtapaForm" class="text ui-widget-content ui-corner-all dialog" />
                  <label for="procedimiento" class="dialog"><g:message code="etapa.procedimiento.label" default="Procedimiento"/></label>
                  <input type="text" name="procedimientoEtapa" id="procedimientoEtapaform" class="text ui-widget-content ui-corner-all dialog" />
                  </fieldset>
                  </form>
                </div>                 
        
        <r:script>
        $(document).ready(function(){
         $( "#dialog-form-etapa" ).dialog("close");
         $( "#dialog:ui-dialog" ).dialog( "destroy" );
         var nombre = $("#nombreEtapaForm"),
          procedimiento=$("#procedimientoEtapaform"),
          allFields = $( [] ).add( nombre ).add(procedimiento),
          tips = $( ".validateTips" );
          
         function updateTips( t ) {
		tips.text( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
		tips.removeClass( "ui-state-highlight", 1500 );
				}, 
		500 );
	}
        
        function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
	}
         
         
        $( "#dialog-form-etapa" ).dialog({
                                autoOpen: false,
				height: 400,
				width: 650,
				modal: true,
                                buttons: {
                                  "Agregar Etapa": function() {
						var bValid = true;
						allFields.removeClass( "ui-state-error" );
							
						if ( bValid ) {
							$( "#nombreEtapaForm" ).text( nombre.val());
							$( "#procedimientoEtapaform" ).text( procedimiento.val());
							$( "#dialog-form-etapa" ).dialog( "close" );
							window.location="/saum/receta/saveMin?nombre="+$( "#nombreform" ).text()+"&rendimiento="+$( "#rendimientoform" ).text()
	
						}
					},
                                        Cancelar: function() {
						$( "#dialog-form-etapa" ).dialog( "close" );
					}
                                },close: function() {
					allFields.val( "" ).removeClass( "ui-state-error" );
				}
                                });
        $("#crear-etapa").click(function(){
          $( "#dialog-form-etapa" ).dialog("open");
        });
        });  
        </r:script>
 	</body>
</html>
