package saum
import org.saum.Constantes

class Receta {
	String nombre
	static hasMany=[etapas:Etapa]
        BigDecimal rendimiento
//detalles generales
	String tipoPlato
    String temperatura
    String tiempo
    String porcion
    String textura
    String forma
    String color
    String sabor
//detalles de valor nutrimental por porcion
    String calorias
    String proteinas
    String grasa
    String carbohidratos
    String colesterol
    String sodio
    String fibra    
    
    static constraints = {
		nombre unique:true, blank:false, maxSize:70
		rendimiento blank:false, matches:"[0-9]+"
		temperatura maxSize:40, nullable:true
		tiempo maxSize:40, nullable:true
		porcion maxSize:40, nullable:true
		textura maxSize:40, nullable:true
		forma maxSize:40, nullable:true
		color maxSize:40, nullable:true
		sabor maxSize:40, nullable:true
		calorias maxSize:40, nullable:true
		proteinas maxSize:40, nullable:true
		grasa maxSize:40, nullable:true
		carbohidratos maxSize:40, nullable:true
		colesterol maxSize:40, nullable:true
		sodio maxSize:40, nullable:true
		fibra maxSize:40, nullable:true
		tipoPlato nullable:true ,inList:[ Constantes.TIPO_PLATO_ENS, Constantes.TIPO_PLATO_SOP, Constantes.TIPO_PLATO_ACO,
			Constantes.TIPO_PLATO_SAL, Constantes.TIPO_PLATO_PLF, Constantes.TIPO_PLATO_FRI, Constantes.TIPO_PLATO_ALM, 
			Constantes.TIPO_PLATO_BEB,Constantes.TIPO_PLATO_POS, Constantes.TIPO_PLATO_ADE, Constantes.TIPO_PLATO_TP1, 
			Constantes.TIPO_PLATO_TP2, Constantes.TIPO_PLATO_TP3 ]
	}    
    
    static mapping = {
        etapas sort: 'id', order: 'asc'
        etapas casacade: 'all'
    }

    void setNombre( String n){
        nombre = n?.toUpperCase()
    }

    void setTextura(String str){
        textura=str?.toUpperCase()
    }
    
    void setForma(String str){
        forma=str?.toUpperCase()
    }
    
    void setColor(String str){
        color=str?.toUpperCase()
    }
    void setSabor(String str){
        sabor=str?.toUpperCase()
    }
    
}
