<%@ page import="saum.Etapa" %>



<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="etapa.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="70" required="" value="${etapaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'procedimiento', 'error')} ">
	<label for="procedimiento">
		<g:message code="etapa.procedimiento.label" default="Procedimiento" />
		
	</label>
	<g:textArea name="procedimiento" cols="40" rows="5" maxlength="10000" value="${etapaInstance?.procedimiento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'ingredientes', 'error')} ">
	<label for="ingredientes">
		<g:message code="etapa.ingredientes.label" default="Ingredientes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${etapaInstance?.ingredientes?}" var="i">
    <li><g:link controller="ingrediente" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ingrediente" action="create" params="['etapa.id': etapaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ingrediente.label', default: 'Ingrediente')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'receta', 'error')} required">
	<label for="receta">
		<g:message code="etapa.receta.label" default="Receta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receta" name="receta.id" from="${saum.Receta.list()}" optionKey="id" required="" value="${etapaInstance?.receta?.id}" class="many-to-one"/>
</div>

