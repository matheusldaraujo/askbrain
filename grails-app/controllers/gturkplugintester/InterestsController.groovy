package gturkplugintester



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InterestsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Interests.list(params), model: [interestsInstanceCount: Interests.count()]
    }

    def show(Interests interestsInstance) {
        respond interestsInstance
    }

    def create() {
        respond new Interests(params)
    }

    @Transactional
    def save(Interests interestsInstance) {
        if (interestsInstance == null) {
            notFound()
            return
        }

        if (interestsInstance.hasErrors()) {
            respond interestsInstance.errors, view: 'create'
            return
        }

        interestsInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interestsInstance.label', default: 'Interests'), interestsInstance.id])
                redirect interestsInstance
            }
            '*' { respond interestsInstance, [status: CREATED] }
        }
    }

    def edit(Interests interestsInstance) {
        respond interestsInstance
    }

    @Transactional
    def update(Interests interestsInstance) {
        if (interestsInstance == null) {
            notFound()
            return
        }

        if (interestsInstance.hasErrors()) {
            respond interestsInstance.errors, view: 'edit'
            return
        }

        interestsInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Interests.label', default: 'Interests'), interestsInstance.id])
                redirect interestsInstance
            }
            '*' { respond interestsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Interests interestsInstance) {

        if (interestsInstance == null) {
            notFound()
            return
        }

        interestsInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Interests.label', default: 'Interests'), interestsInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interestsInstance.label', default: 'Interests'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
