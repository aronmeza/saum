package saum

class Ingrediente {
	BigDecimal cantidad
	String unidadMedida
	String presentacion
	static belongsTo=[etapa:Etapa, materia:MateriaPrima]	

    static constraints = {
		cantidad scale:2, precision:8, blank:false
		unidadMedida inList:[Constantes.UNIDAD_MEDIDA_KILOGRAMO,'gr','l','ml','pza']
		presentacion maxSize:40
		etapa maxSize:40, default:'General'
    }
    
    String toString(){
        return cantidad + " " + unidadMedida + " " + materia.nombre +" " +presentacion + " " + etapa
        
    }
}
