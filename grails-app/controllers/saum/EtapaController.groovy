package saum

import org.springframework.dao.DataIntegrityViolationException

class EtapaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [etapaInstanceList: Etapa.list(params), etapaInstanceTotal: Etapa.count()]
    }

    def create() {
        [etapaInstance: new Etapa(params)]
    }
	
	def createMin() {
		def receta = Receta.get(params?.recetaId)
                log.debug "--------------> ${params?.recetaId}"
                log.debug "--------------> ${params?.nombreEtapa}"
		def etapa=new Etapa(nombre:params?.nombreEtapa,receta:receta).save(flush:true)
		
        render(view:'edit', model:[etapaInstance: etapa, ingredienteInstance:new Ingrediente()])
    }
	
    def save() {
        log.debug "Save ${params}"
        def etapaInstance = new Etapa(params)
        if (!etapaInstance.save(flush: true)) {
            render(view: "create", model: [etapaInstance: etapaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'etapa.label', default: 'Etapa'), etapaInstance.id])
        redirect(action: "show", id: etapaInstance.id)
    }

    def show() {
        def etapaInstance = Etapa.get(params.id)
        if (!etapaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            redirect(action: "list")
            return
        }

        [etapaInstance: etapaInstance]
    }

    def edit() {
        def etapaInstance = Etapa.get(params.id)
        if (!etapaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            redirect(action: "list")
            return
        }

        [etapaInstance: etapaInstance, ingredienteInstance:new Ingrediente()]
    }

    def update() {
        def etapaInstance = Etapa.get(params.id)
        if (!etapaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (etapaInstance.version > version) {
                etapaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'etapa.label', default: 'Etapa')] as Object[],
                          "Another user has updated this Etapa while you were editing")
                render(view: "edit", model: [etapaInstance: etapaInstance])
                return
            }
        }

        etapaInstance.properties = params

        if (!etapaInstance.save(flush: true)) {
            render(view: "edit", model: [etapaInstance: etapaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'etapa.label', default: 'Etapa'), etapaInstance.id])
		redirect(controller:"receta", action:"edit", id: etapaInstance.receta.id)
        //redirect(action: "show", id: etapaInstance.id)
    }

    def delete() {
        def etapaInstance = Etapa.get(params.id)
        if (!etapaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            redirect(action: "list")
            redirect(controller:'receta',action:'index')
            return
        }

        try {
        	def idReceta= etapaInstance.receta.id
            etapaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            //redirect(action: "list")
            redirect(controller:'receta',action:'index', id: idReceta)
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
            redirect(action: "show", id: params.id)
            redirect(controller:'receta', action:'edit', id:idReceta)
        }
    }
}
