<%@ page import="saum.Ingrediente" %>



<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="ingrediente.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" step="0.01" required="" value="${fieldValue(bean: ingredienteInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'unidadMedida', 'error')} ">
	<label for="unidadMedida">
		<g:message code="ingrediente.unidadMedida.label" default="Unidad Medida" />
		
	</label>
	<g:select name="unidadMedida" from="${ingredienteInstance.constraints.unidadMedida.inList}" value="${ingredienteInstance?.unidadMedida}" valueMessagePrefix="ingrediente.unidadMedida" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'materia', 'error')} required">
	<label for="materia">
		<g:message code="ingrediente.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	</label>
	<!--g:select id="materia" name="materia.id" from="${saum.MateriaPrima.list()}" optionKey="id" required="" value="${ingredienteInstance?.materia?.id}" class="many-to-one"/-->
	 <input type="text" id="ingNombre" name="materia.nombre" id="ingNombre" value="${ingredienteInstance?.materia?.nombre}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'presentacion', 'error')} ">
	<label for="presentacion">
		<g:message code="ingrediente.presentacion.label" default="Presentacion" />
		
	</label>
	<g:textField name="presentacion" maxlength="40" value="${ingredienteInstance?.presentacion}"/>
</div>


<r:script>
	$(document).ready(function(){
		$("input#ingNombre").autocomplete({
		   source: '${createLink(action:'buscaMateriaPrima', controller:'MateriaPrima')}'
	   });
	});
</r:script>
