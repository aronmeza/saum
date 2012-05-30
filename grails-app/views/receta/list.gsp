
<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="jquery-ui"/>
	</head>
	<body>
		
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
		
		
		<input id="crear-receta" class="button green rigth" style="color:#ffffff;" value="${message(code: 'default.button.new.receta', default: 'Nueva Receta')}" />
		
		
		
<div id="dialog-form-receta" title="Agregar Receta">
  <p class="validateTips"></p>

  <form id="formrecetasend" action="/saum/receta/save"  method="POST" >
    <fieldset class="dialog">
      <label for="nombre" class="dialog"><g:message code="receta.nombre.label" default="Nombre"/></label>
      <input type="text" name="nombre" id="nombreform" class="text ui-widget-content ui-corner-all dialog" />
      <br/>
      <label for="rendimiento" class="dialog"><g:message code="receta.rendimiento.label" default="Rendimiento"/></label>
      <input type="text" name="rendimiento" id="rendimientoform" value="" class="text ui-widget-content ui-corner-all dialog" />
    </fieldset>

  </form>
</div>

	<r:script>
	  $(document).ready(function(){
	  $( "#dialog-form-receta" ).dialog( "close" );	
	  $( "#dialog:ui-dialog" ).dialog( "destroy" );
		var nombre = $( "#nombreform" ),
			rendimiento = $( "#rendimientoform" ),
			allFields = $( [] ).add( nombre ).add(rendimiento),
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
	
		$( "#dialog-form-receta" ).dialog({
				autoOpen: false,
				height: 400,
				width: 650,
				modal: true,
				buttons: {
					"Agregar Receta": function() {
						var bValid = true;
						allFields.removeClass( "ui-state-error" );
						bValid = bValid && checkRegexp( $("#rendimientoform"), /^([0-9])+$/, "<g:message code="receta.rendimiento.error.numero"/>" );
	
						if ( bValid ) {
							$( "#rendimientoform" ).text( rendimiento.val());
							$( "#nombreform" ).text(nombre.val() ); 
							$( "#dialog-form-receta" ).dialog( "close" );
							window.location="/saum/receta/saveMin?nombre="+$( "#nombreform" ).text()+"&rendimiento="+$( "#rendimientoform" ).text()
	
						}
					},
					Cancelar: function() {
						$( "#dialog-form-receta" ).dialog( "close" );
					}
				},
				close: function() {
					allFields.val( "" ).removeClass( "ui-state-error" );
				}
			});
	
			$( "#crear-receta" )	
				.click(function() {
		$( "#dialog-form-receta" ).dialog( "open" );
		});
	});
	</r:script>
		
	
	</body>
</html>
