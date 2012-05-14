<%@ page import="saum.Receta" %>



<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="receta.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="70" required="" value="${recetaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'rendimiento', 'error')} required">
	<label for="rendimiento">
		<g:message code="receta.rendimiento.label" default="Rendimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rendimiento" required="" value="${fieldValue(bean: recetaInstance, field: 'rendimiento')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'temperatura', 'error')} ">
	<label for="temperatura">
		<g:message code="receta.temperatura.label" default="Temperatura" />
		
	</label>
	<g:textField name="temperatura" maxlength="40" value="${recetaInstance?.temperatura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'tiempo', 'error')} ">
	<label for="tiempo">
		<g:message code="receta.tiempo.label" default="Tiempo" />
		
	</label>
	<g:textField name="tiempo" maxlength="40" value="${recetaInstance?.tiempo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'porcion', 'error')} ">
	<label for="porcion">
		<g:message code="receta.porcion.label" default="Porcion" />
		
	</label>
	<g:textField name="porcion" maxlength="40" value="${recetaInstance?.porcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'textura', 'error')} ">
	<label for="textura">
		<g:message code="receta.textura.label" default="Textura" />
		
	</label>
	<g:textField name="textura" maxlength="40" value="${recetaInstance?.textura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'forma', 'error')} ">
	<label for="forma">
		<g:message code="receta.forma.label" default="Forma" />
		
	</label>
	<g:textField name="forma" maxlength="40" value="${recetaInstance?.forma}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="receta.color.label" default="Color" />
		
	</label>
	<g:textField name="color" maxlength="40" value="${recetaInstance?.color}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'sabor', 'error')} ">
	<label for="sabor">
		<g:message code="receta.sabor.label" default="Sabor" />
		
	</label>
	<g:textField name="sabor" maxlength="40" value="${recetaInstance?.sabor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'calorias', 'error')} ">
	<label for="calorias">
		<g:message code="receta.calorias.label" default="Calorias" />
		
	</label>
	<g:textField name="calorias" maxlength="40" value="${recetaInstance?.calorias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'proteinas', 'error')} ">
	<label for="proteinas">
		<g:message code="receta.proteinas.label" default="Proteinas" />
		
	</label>
	<g:textField name="proteinas" maxlength="40" value="${recetaInstance?.proteinas}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'grasa', 'error')} ">
	<label for="grasa">
		<g:message code="receta.grasa.label" default="Grasa" />
		
	</label>
	<g:textField name="grasa" maxlength="40" value="${recetaInstance?.grasa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'carbohidratos', 'error')} ">
	<label for="carbohidratos">
		<g:message code="receta.carbohidratos.label" default="Carbohidratos" />
		
	</label>
	<g:textField name="carbohidratos" maxlength="40" value="${recetaInstance?.carbohidratos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'colesterol', 'error')} ">
	<label for="colesterol">
		<g:message code="receta.colesterol.label" default="Colesterol" />
		
	</label>
	<g:textField name="colesterol" maxlength="40" value="${recetaInstance?.colesterol}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'sodio', 'error')} ">
	<label for="sodio">
		<g:message code="receta.sodio.label" default="Sodio" />
		
	</label>
	<g:textField name="sodio" maxlength="40" value="${recetaInstance?.sodio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'fibra', 'error')} ">
	<label for="fibra">
		<g:message code="receta.fibra.label" default="Fibra" />
		
	</label>
	<g:textField name="fibra" maxlength="40" value="${recetaInstance?.fibra}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'tipoPlato', 'error')} ">
	<label for="tipoPlato">
		<g:message code="receta.tipoPlato.label" default="Tipo Plato" />
		
	</label>
	<g:select name="tipoPlato" from="${recetaInstance.constraints.tipoPlato.inList}" value="${recetaInstance?.tipoPlato}" valueMessagePrefix="receta.tipoPlato" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'etapas', 'error')} ">
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

</div>

