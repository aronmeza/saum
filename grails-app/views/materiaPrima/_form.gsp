<%@ page import="saum.MateriaPrima" %>



<div class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="materiaPrima.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="128" required="" value="${materiaPrimaInstance?.nombre}"/>
</div>

