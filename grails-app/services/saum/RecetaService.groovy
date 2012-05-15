package saum
import org.springframework.transaction.annotation.Transactional
import org.saum.Constantes

class RecetaService {
    @Transactional(readOnly = true)
     Receta convertirReceta (BigDecimal rendimiento, def id){
         Receta receta=Receta.get(id)
         for(Etapa etapa:receta.etapas){
             for(Ingrediente ingrediente:etapa.ingredientes){
                 ingrediente.cantidad = ingrediente.cantidad.multiply(cantidad.divide(rendimiento,2,BigDecimal.ROUND_HALF_UP))
                 ingrediente=convierteUnidadMedida(ingrediente)
             }             
         }
         receta.rendimiento=rendimiento
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
            if(ingrediente.cantidadintValue()==0){
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

}
