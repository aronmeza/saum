package saum
import org.saum.Constantes
class Ingrediente {
	BigDecimal cantidad
	String unidadMedida
	String presentacion
	static belongsTo=[etapa:Etapa, materia:MateriaPrima]	

    static constraints = {
		cantidad scale:2, precision:8, blank:false
		unidadMedida inList:[Constantes.UNIDAD_MEDIDA_KILOGRAMO,Constantes.UNIDAD_MEDIDA_GRAMO,Constantes.UNIDAD_MEDIDA_LITRO,Constantes.UNIDAD_MEDIDA_MILILITRO,Constantes.UNIDAD_MEDIDA_PIEZA]
		presentacion maxSize:40
		etapa maxSize:40, default:'General'
    }
    
    String toString(){
    	String decimales = String.format("%.2f", cantidad);
    	if(decimales.substring(decimales.length()-2).equals("00")){
    		return decimales.substring(0,decimales.length()-3) + " " + unidadMedida + " " + materia.nombre +" " +presentacion
    	}
    	return decimales + " " + unidadMedida + " " + materia.nombre +" " +presentacion
        
    }
    
    
    void setPresentacion(String str){
        presentacion=str?.toUpperCase()
    }
}
