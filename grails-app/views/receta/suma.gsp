<%@ page defaultCodec="IngredienteFormat" %>
<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
		
				
      <style type="text/css">
		.ui-button { margin-left: -1px; }
		.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
		.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
		
                
                #wrapper{
                  font-weight:lighter;
                  font-size: .8em;
                }
	    
	    </style>
                
	</head>
	<body>
        <center><h1>Suma de recetas</h1></center>
        
<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
                       
        	</fieldset>     
        	        <g:actionSubmit class="button green" action="sumaReceta"  value="Suma Receta" />
                        
</g:form>    

	
 <div id="wrapper" class="div-l">
   <h1>Ingredientes Sumados</h1>
                        <ol>
                        <g:if  test="${listaIngredientes}">
                                    <g:each  in="${listaIngredientes}" var="i">
                                          <!--li><h3><a><span aria-labelledby="ingredientes-label">${i?.cantidad} ${i?.unidadMedida} ${i?.materia.nombre}</span></a></h3></li-->
                                          <li><h3><a><span aria-labelledby="ingredientes-label">${i?.encodeAsHTML()} </span></a></h3></li>        
                                </g:each>
                            </g:if>
                        </ol>
</div>
<div id="recetas" class="div-r">
  <h1>Recetas Sumadas</h1>
  <ol>
    <g:if  test="${listaRecetasSumadas}">
      <g:each  in="${listaRecetasSumadas}" var="i">
        <li><h3><a><span aria-labelledby="ingredientes-label">${i?.nombre} ${i?.rendimiento}</span></a></h3></li>        
      </g:each>
    </g:if>
  </ol>
</div>
        



	</body>
</html>