package saum

import org.springframework.dao.DataIntegrityViolationException

class IngredienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredienteInstanceList: Ingrediente.list(params), ingredienteInstanceTotal: Ingrediente.count()]
    }

    def create() {
        [ingredienteInstance: new Ingrediente(params)]
    }

    def save() {
        def ingredienteInstance = new Ingrediente(params)
        ingredienteInstance.etapa=Etapa.get(params.etapaId)
        if (!ingredienteInstance.save(flush: true)) {
            render(view: "create", model: [ingredienteInstance: ingredienteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])
        redirect(action: "show", id: ingredienteInstance.id)
    }

    def show() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        [ingredienteInstance: ingredienteInstance]
    }

    def edit() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        [ingredienteInstance: ingredienteInstance]
    }
    
    def edit2() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        [ingredienteInstance: ingredienteInstance]
    }

    def update() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ingredienteInstance.version > version) {
                ingredienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ingrediente.label', default: 'Ingrediente')] as Object[],
                          "Another user has updated this Ingrediente while you were editing")
                render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
                return
            }
        }

        ingredienteInstance.properties = params
		def materia= MateriaPrima.findByNombre(params.materia.nombre)
		if(materia!=null){
			ingredienteInstance.materia = materia
		}else{
			materia= new MateriaPrima(
				nombre:params.materia.nombre
				).save(flush:true)
			ingredienteInstance.materia = materia
		}
		
        if (!ingredienteInstance.save(flush: true)) {
            render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])
        //redirect(action: "show", id: c.id)
        redirect(controller:"receta", action:"edit", id:ingredienteInstance.etapa.receta.id)
    }

	def update2() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ingredienteInstance.version > version) {
                ingredienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ingrediente.label', default: 'Ingrediente')] as Object[],
                          "Another user has updated this Ingrediente while you were editing")
                render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
                return
            }
        }

        ingredienteInstance.properties = params
		def materia= MateriaPrima.findByNombre(params.materia.nombre)
		if(materia!=null){
			ingredienteInstance.materia = materia
		}else{
			materia= new MateriaPrima(
				nombre:params.materia.nombre
				).save(flush:true)
			ingredienteInstance.materia = materia
		}
		
        if (!ingredienteInstance.save(flush: true)) {
            render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])
        //redirect(action: "show", id: c.id)
        redirect(controller:"etapa", action:"edit", id:ingredienteInstance.etapa.id)
    }
    
    def delete() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ingredienteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
