package gturkplugintester



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DemographicsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Demographics.list(params), model:[demographicsInstanceCount: Demographics.count()]
    }

    def show(Demographics demographicsInstance) {
        respond demographicsInstance
    }

    def create() {
        print("===============================")
        def demographic = new Demographics(params)
        print(demographic)
        print(params)
        respond demographic
    }

    @Transactional
    def save(Demographics demographicsInstance) {
        if (demographicsInstance == null) {
            notFound()
            return
        }

        if (demographicsInstance.hasErrors()) {
            respond demographicsInstance.errors, view:'create'
            return
        }

        demographicsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'demographicsInstance.label', default: 'Demographics'), demographicsInstance.id])
                redirect demographicsInstance
            }
            '*' { respond demographicsInstance, [status: CREATED] }
        }
    }

    def edit(Demographics demographicsInstance) {
        respond demographicsInstance
    }

    @Transactional
    def update(Demographics demographicsInstance) {
        if (demographicsInstance == null) {
            notFound()
            return
        }

        if (demographicsInstance.hasErrors()) {
            respond demographicsInstance.errors, view:'edit'
            return
        }

        demographicsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Demographics.label', default: 'Demographics'), demographicsInstance.id])
                redirect demographicsInstance
            }
            '*'{ respond demographicsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Demographics demographicsInstance) {

        if (demographicsInstance == null) {
            notFound()
            return
        }

        demographicsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Demographics.label', default: 'Demographics'), demographicsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'demographicsInstance.label', default: 'Demographics'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
