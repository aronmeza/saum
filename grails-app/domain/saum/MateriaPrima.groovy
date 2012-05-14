package saum

class MateriaPrima {
	String nombre
    
    static constraints = {
		nombre unique:true, maxSize:128, blank:false
    }

    static namedQueries = {
		buscaPorNombre{ filtro ->
			filtro="${filtro.toUpperCase()}%"
			ilike 'nombre', filtro
			}
	}
	
	void setNombre( String n){
		nombre = n?.toUpperCase()
	}

}
