
<%@ page import="saum.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
		<style type="text/css">

	    @media print
	    {
             h2{ color: #48802c;}
             h3{
              font-weight: lighter;
              font-size: .8em;
              margin: 0.8em 0 0.3em 0;
            } 
            #botonesNav{display:none}
	    	.footer { display: none; }
	        #menu { display: none; }
	        #printable { display: block; }
                #grailsLogo{ float: right}
                .message{display:none;}
                ol{  width: 45em; }
                ol li{  float: left;  width: 15em; }
                br{  clear: left;}
                div.wrapper{  margin-bottom: 1em;}
                ol li a{  display: block;  width: 15em;  text-decoration: none;}

	    }
	    </style>
	</head>
	<body>
<div id="show-receta">
<h1 style="margin:0px 0px 0px 0px;">${recetaInstance?.nombre}</h1>
		<div class="div-l">
			
			<h4>${recetaInstance.rendimiento} porciones<g:if test="${recetaInstance?.tiempo}">, ${recetaInstance?.tiempo}</g:if> </h4>
		</div>
		<div class="div-r" align="right">
			<g:if test="${recetaInstance?.temperatura}">
				<h4>${recetaInstance?.temperatura} grados Centigrados</h4>
			</g:if>
		</div>
<br/>
<br/>

<g:if test="${recetaInstance?.etapas}">
<g:each in="${recetaInstance?.etapas?}" var="e">
<h2>${e?.nombre}</h2>
<div class="border">	
	<div class="row">
		<div class="div-r">
			<label for="procedimiento">
				<g:message code="etapa.procedimiento.label" default="Procedimiento" />
				
			</label>
			<!--g:textArea name="procedimiento" cols="40" rows="5" maxlength="10000" value="${e?.procedimiento}"/-->
			<br/>
			${e?.procedimiento}
		</div>
		
		<div class="div-l">
			<label for="ingredientes">
				<g:message code="etapa.ingredientes.label" default="Ingredientes" />
				
			</label>
			<br/>
		<ul class="one-to-many">
		<g:each in="${e?.ingredientes?}" var="i">
		
		    <li>${i?.encodeAsHTML()}</li>
		</g:each>	
		</div>
			
	</div>	
	
</div>
</g:each>
</g:if>

<div >
<h3><a>Datos Complementarios</a></h3>
<br/>
<br/>
	<div class="row">
	<g:if test="${recetaInstance?.porcion}">
		<div class="${hasErrors(bean: recetaInstance, field: 'porcion', 'error')} div-l">
			<label for="porcion">
				<g:message code="receta.porcion.label" default="Porcion" />
				
			</label>
			${recetaInstance?.porcion}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.textura}">
		<div class="${hasErrors(bean: recetaInstance, field: 'textura', 'error')}div-r">
			<label for="textura">
				<g:message code="receta.textura.label" default="Textura" />
				
			</label>
			${recetaInstance?.textura}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.forma}">
		<div class="${hasErrors(bean: recetaInstance, field: 'forma', 'error')} div-l">
			<label for="forma">
				<g:message code="receta.forma.label" default="Forma" />
				
			</label>
			${recetaInstance?.forma}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.color}">
		<div class="${hasErrors(bean: recetaInstance, field: 'color', 'error')} div-r">
			<label for="color">
				<g:message code="receta.color.label" default="Color" />
				
			</label>
			${recetaInstance?.color}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.sabor}">
		<div class="${hasErrors(bean: recetaInstance, field: 'sabor', 'error')} div-l">
			<label for="sabor">
				<g:message code="receta.sabor.label" default="Sabor" />
				
			</label>
			${recetaInstance?.sabor}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.calorias}">
		<div class="${hasErrors(bean: recetaInstance, field: 'calorias', 'error')} div-r">
			<label for="calorias">
				<g:message code="receta.calorias.label" default="Calorias" />
				
			</label>
			${recetaInstance?.calorias}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.proteinas}">
		<div class="${hasErrors(bean: recetaInstance, field: 'proteinas', 'error')} div-l">
			<label for="proteinas">
				<g:message code="receta.proteinas.label" default="Proteinas" />
				
			</label>
			${recetaInstance?.proteinas}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.grasa}">
		<div class="${hasErrors(bean: recetaInstance, field: 'grasa', 'error')} div-r">
			<label for="grasa">
				<g:message code="receta.grasa.label" default="Grasa" />
				
			</label>
			${recetaInstance?.grasa}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.carbohidratos}">
		<div class="${hasErrors(bean: recetaInstance, field: 'carbohidratos', 'error')} div-l">
			<label for="carbohidratos">
				<g:message code="receta.carbohidratos.label" default="Carbohidratos" />
				
			</label>
			${recetaInstance?.carbohidratos}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.colesterol}">
		<div class="${hasErrors(bean: recetaInstance, field: 'colesterol', 'error')} div-r">
			<label for="colesterol">
				<g:message code="receta.colesterol.label" default="Colesterol" />
				
			</label>
			${recetaInstance?.colesterol}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.sodio}">
		<div class="${hasErrors(bean: recetaInstance, field: 'sodio', 'error')} div-l">
			<label for="sodio">
				<g:message code="receta.sodio.label" default="Sodio" />
				
			</label>
			${recetaInstance?.sodio}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.fibra}">
		<div class="${hasErrors(bean: recetaInstance, field: 'fibra', 'error')} div-r">
			<label for="fibra">
				<g:message code="receta.fibra.label" default="Fibra" />
				
			</label>
			${recetaInstance?.fibra}
		</div>
		</g:if>
		
		<g:if test="${recetaInstance?.tipoPlato}">
		<div class="${hasErrors(bean: recetaInstance, field: 'tipoPlato', 'error')}div-l ">
			<label for="tipoPlato">
				<g:message code="receta.tipoPlato.label" default="Tipo Plato" />
				
			</label>
			${recetaInstance?.tipoPlato}
		</div>
		</g:if>
	</div>
</div>
		
		
		
	<div id="botonesNav">
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${recetaInstance?.id}" />
				<g:link class="edit" action="edit" id="${recetaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</div>
	</body>
</html>
