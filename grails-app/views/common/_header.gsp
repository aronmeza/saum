
<nav role="navigation">

  <ul id="menu"> 
    <li tabindex="0"><h2><a href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Inicio"/></a></h2></li>
    <li tabindex="0"><h2><g:link action="list" controller="receta"><g:message code="default.receta.label" default="Rececta"/></g:link></h2>
      <ul class="submenu" tabindex="0"> 
        
        <li tabindex="0"><a id="crear-receta" href="#"><g:message code="default.receta.new" default="Crear Rececta"/></a></li>
	<li tabindex="0"><g:link action="index" controller="receta"><g:message code="default.receta.convert" default=""/></g:link></li>
      </ul>
    </li>
    <li tabindex="0"><h2><g:link action="index" controller="materiaPrima"><g:message code="default.materiaPrima.label"/></g:link></h2>
    </li> 
    <sec:ifLoggedIn>
      <li tabindex="0"><h2><g:link action="indexSuma" controller="receta"><g:message code="default.factura.label" default="Suma Recetas"/></g:link></h2></li>
</sec:ifLoggedIn>
  </ul>

  </nav>



