package saum
import org.springframework.transaction.annotation.Transactional
import org.saum.Constantes

class RecetaService {
    @Transactional(readOnly = true)
     Receta convertirReceta (BigDecimal rendimiento, def id){
         log.debug "convertirReceta ${rendimiento}"
         Receta receta=Receta.get(id)
         for(Etapa etapa:receta.etapas){
             for(Ingrediente ingrediente:etapa.ingredientes){
                 log.debug "+++++++++>Ingrediente ${ingrediente.materia.nombre} Cantidad ${ingrediente.cantidad} Unidad ${ingrediente.unidadMedida}"
                 ingrediente.cantidad = ingrediente.cantidad.multiply(rendimiento.divide(receta.rendimiento,2,BigDecimal.ROUND_HALF_UP))
                 ingrediente=convierteUnidadMedida(ingrediente)
                 log.debug "+++++++++>Ingrediente ${ingrediente.materia.nombre} Cantidad ${ingrediente.cantidad} Unidad ${ingrediente.unidadMedida}"
             }             
         }
         //receta.rendimiento=rendimiento
         return receta
     }
     
    
    Ingrediente convierteUnidadMedida(Ingrediente ingrediente){
        if (ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_GRAMO) || ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_MILILITRO)){
            if(ingrediente.cantidad/1000>=1){
                ingrediente.cantidad = ingrediente.cantidad/1000
                if(ingrediente.unidadMedida == Constantes.UNIDAD_MEDIDA_GRAMO){
                    ingrediente.unidadMedida = Constantes.UNIDAD_MEDIDA_KILOGRAMO
                }else{
                    ingrediente.unidadMedida = Constantes.UNIDAD_MEDIDA_LITRO
                }
            }
        }else if(ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_KILOGRAMO)||ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_LITRO)){
            if(ingrediente.cantidad.intValue()==0){
                ingrediente.cantidad=ingrediente.cantidad.multiply(new BigDecimal("1000"))
                if(ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_KILOGRAMO)){
                    ingrediente.unidadMedida=Constantes.UNIDAD_MEDIDA_GRAMO
                }else{
                    ingrediente.unidadMedida=Constantes.UNIDAD_MEDIDA_MILILITRO
                }
            }
        }
        return ingrediente
    }
    
    
    @Transactional(readOnly = true)    
    List<Ingrediente> sumaIngredientes(List<Ingrediente> ingrs, Long idReceta, BigDecimal rendimiento){
       Map<Long,Ingrediente> suma=new HashMap<Integer, BigDecimal>()
       for(Ingrediente ing:ingrs){
           ing=homologarUnidadMedida(ing)
           suma.put(ing.materia.id,ing)
       }
       def receta=convertirReceta (rendimiento, idReceta)
       for(Etapa etapa:receta.etapas){  
        for(Ingrediente ingres:etapa.ingredientes){
               ingres=homologarUnidadMedida(ingres)
               if(suma.containsKey(ingres.materia.id)){
                ingres.cantidad=suma.getAt(ingres.materia.id).cantidad.add(ingres.cantidad)
                suma.put(ingres.materia.id,ingres)
            }else{
                   suma.put(ingres.materia.id,ingres)
            }
       }
    }
       
        List<Ingrediente> nueva=new ArrayList<Ingrediente>()
        def llaves=suma.keySet()
        def itera=llaves.iterator()
        while(itera.hasNext()){
            Long id=itera.next() 
            Ingrediente ingreFinal=suma.getAt(id)
            ingreFinal=convierteUnidadMedida(ingreFinal)
            nueva.add(ingreFinal)
        }        
        return nueva
    }
    
    Ingrediente homologarUnidadMedida(Ingrediente ingrediente){
        if(ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_KILOGRAMO)||ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_LITRO)){
            ingrediente.cantidad = ingrediente.cantidad.multiply(new BigDecimal("1000"))
            if(ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_KILOGRAMO)){
                ingrediente.unidadMedida = Constantes.UNIDAD_MEDIDA_GRAMO
            }else if(ingrediente.unidadMedida.equals(Constantes.UNIDAD_MEDIDA_LITRO)){
                ingrediente.unidadMedida = Constantes.UNIDAD_MEDIDA_MILILITRO
            }
        }
        return ingrediente
    }

}
