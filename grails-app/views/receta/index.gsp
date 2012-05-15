<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><g:message code="default.comedor"/></title>
		<r:require module="jquery-ui"/>
		
				
                  <style>
	.ui-button { margin-left: -1px; }
	.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
	.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
	</style>
       
	</head>
	<body>
	
	<div id="body" role="main">
	<h1><g:message code="default.welcome"/></h1>
	
	<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
        	</fieldset>     
        	        <g:actionSubmit class="button green" action="show"  value="Convertir" />
	</g:form>     
    
    
	</div>
       

          <script type="text/javascript">

  </script>
	</body>
        
        
      
	


        
</html>
