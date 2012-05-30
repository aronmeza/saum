<%@ page import="saum.Etapa" %>


<div class="row">
<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'nombre', 'error')} required div-l"  style="width:100%;margin:0px 0px 10px -45px;" >
	<label for="nombre">
		<g:message code="etapa.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="70" required="" value="${etapaInstance?.nombre}"/>
</div>
</div>
<div class="row">
<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'procedimiento', 'error')} div-r">
	<label for="procedimiento">
		<g:message code="etapa.procedimiento.label" default="Procedimiento" />
		
	</label>
	<g:textArea name="procedimiento" cols="40" rows="5" maxlength="10000" value="${etapaInstance?.procedimiento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'ingredientes', 'error')} div-l">
	<label for="ingredientes">
		<g:message code="etapa.ingredientes.label" default="Ingredientes" />
		
	</label>
	<br/>
<ul class="one-to-many">
<table>
<tr>
<td>
<g:each in="${etapaInstance?.ingredientes?}" var="i">
    <li><g:link controller="ingrediente" action="edit2" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
</td>
</tr>
</table>
</div>
</div>

<!--div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'receta', 'error')} required">
	<label for="receta">
		<g:message code="etapa.receta.label" default="Receta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receta" name="receta.id" from="${saum.Receta.list()}" optionKey="id" required="" value="${etapaInstance?.receta?.id}" class="many-to-one"/>
</div-->

