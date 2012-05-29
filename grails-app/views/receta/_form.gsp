<%@ page import="saum.Receta" %>

<div >
	<div class="row">
		<div class="${hasErrors(bean: recetaInstance, field: 'nombre', 'error')} required div-l">
			<label for="nombre">
				<g:message code="receta.nombre.label" default="Nombre" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField name="nombre" maxlength="70" required="" value="${recetaInstance?.nombre}"/>
		</div>
	
		
		<div class="${hasErrors(bean: recetaInstance, field: 'rendimiento', 'error')} required div-r">
			<label for="rendimiento">
				<g:message code="receta.rendimiento.label" default="Rendimiento" />
				<span class="required-indicator">*</span>
			</label>
			<g:field type="number" name="rendimiento" required="" value="${fieldValue(bean: recetaInstance, field: 'rendimiento')}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'temperatura', 'error')} div-l">
			<label for="temperatura">
				<g:message code="receta.temperatura.label" default="Temperatura" />
				
			</label>
			<g:textField name="temperatura" maxlength="40" value="${recetaInstance?.temperatura}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'tiempo', 'error')}div-r">
			<label for="tiempo">
				<g:message code="receta.tiempo.label" default="Tiempo" />
				
			</label>
			<g:textField name="tiempo" maxlength="40" value="${recetaInstance?.tiempo}"/>
		</div>
	</div>
</div>

<g:each in="${recetaInstance?.etapas?}" var="e">
	<!----------------------------------------------------------------------------------------->
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
		
		    <li><g:link controller="ingrediente" action="edit" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
		</g:each>	
		</div>
			
	</div>	

<g:link class="button green rigth" style="color:#ffffff;" controller="etapa" action="edit" id="${e?.id}">Editar</g:link>
	
</div>
	<!----------------------------------------------------------------------------------------->
</g:each>

<div id="accordion">
<h3><a>Datos Complementarios</a></h3>
	<div>
		<div class="${hasErrors(bean: recetaInstance, field: 'porcion', 'error')} div-l">
			<label for="porcion">
				<g:message code="receta.porcion.label" default="Porcion" />
				
			</label>
			<g:textField name="porcion" maxlength="40" value="${recetaInstance?.porcion}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'textura', 'error')}div-r">
			<label for="textura">
				<g:message code="receta.textura.label" default="Textura" />
				
			</label>
			<g:textField name="textura" maxlength="40" value="${recetaInstance?.textura}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'forma', 'error')} div-l">
			<label for="forma">
				<g:message code="receta.forma.label" default="Forma" />
				
			</label>
			<g:textField name="forma" maxlength="40" value="${recetaInstance?.forma}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'color', 'error')} div-r">
			<label for="color">
				<g:message code="receta.color.label" default="Color" />
				
			</label>
			<g:textField name="color" maxlength="40" value="${recetaInstance?.color}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'sabor', 'error')} div-l">
			<label for="sabor">
				<g:message code="receta.sabor.label" default="Sabor" />
				
			</label>
			<g:textField name="sabor" maxlength="40" value="${recetaInstance?.sabor}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'calorias', 'error')} div-r">
			<label for="calorias">
				<g:message code="receta.calorias.label" default="Calorias" />
				
			</label>
			<g:textField name="calorias" maxlength="40" value="${recetaInstance?.calorias}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'proteinas', 'error')} div-l">
			<label for="proteinas">
				<g:message code="receta.proteinas.label" default="Proteinas" />
				
			</label>
			<g:textField name="proteinas" maxlength="40" value="${recetaInstance?.proteinas}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'grasa', 'error')} div-r">
			<label for="grasa">
				<g:message code="receta.grasa.label" default="Grasa" />
				
			</label>
			<g:textField name="grasa" maxlength="40" value="${recetaInstance?.grasa}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'carbohidratos', 'error')} div-l">
			<label for="carbohidratos">
				<g:message code="receta.carbohidratos.label" default="Carbohidratos" />
				
			</label>
			<g:textField name="carbohidratos" maxlength="40" value="${recetaInstance?.carbohidratos}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'colesterol', 'error')} div-r">
			<label for="colesterol">
				<g:message code="receta.colesterol.label" default="Colesterol" />
				
			</label>
			<g:textField name="colesterol" maxlength="40" value="${recetaInstance?.colesterol}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'sodio', 'error')} div-l">
			<label for="sodio">
				<g:message code="receta.sodio.label" default="Sodio" />
				
			</label>
			<g:textField name="sodio" maxlength="40" value="${recetaInstance?.sodio}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'fibra', 'error')} div-r">
			<label for="fibra">
				<g:message code="receta.fibra.label" default="Fibra" />
				
			</label>
			<g:textField name="fibra" maxlength="40" value="${recetaInstance?.fibra}"/>
		</div>
		
		<div class="${hasErrors(bean: recetaInstance, field: 'tipoPlato', 'error')}div-l ">
			<label for="tipoPlato">
				<g:message code="receta.tipoPlato.label" default="Tipo Plato" />
				
			</label>
			<g:select name="tipoPlato" from="${recetaInstance.constraints.tipoPlato.inList}" value="${recetaInstance?.tipoPlato}" valueMessagePrefix="receta.tipoPlato" noSelection="['': '']"/>
		</div>
	</div>
</div>

<!--div class="${hasErrors(bean: recetaInstance, field: 'etapas', 'error')} ">
	<label for="etapas">
		<g:message code="receta.etapas.label" default="Etapas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${recetaInstance?.etapas?}" var="e">
    <li><g:link controller="etapa" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="etapa" action="create" params="['receta.id': recetaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'etapa.label', default: 'Etapa')])}</g:link>
</li>
</ul>

</div-->
<r:script>
$(function() {
		$( "#accordion" ).accordion({collapsible: true, active: false});
	})
</r:script>
