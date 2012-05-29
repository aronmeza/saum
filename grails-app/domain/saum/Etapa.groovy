package saum

class Etapa {
	String nombre
	String procedimiento
	static belongsTo= [ receta : Receta ]
	static hasMany = [ ingredientes : Ingrediente ]
    
    static constraints = {
    	nombre unique:true, blank:false, maxSize:70
    	procedimiento maxSize:10000, nullable:true
    	
    }
    
    static mapping = {
        ingredientes sort: 'id', order: 'asc'
        ingredientes casacade: 'all'
    }
    
    void setNombre( String n){
		nombre = n?.toUpperCase()
    }
    
    void setProcedimiento( String n){
        procedimiento = n?.toUpperCase()
    }
}
