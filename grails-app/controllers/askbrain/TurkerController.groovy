package askbrain

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK


class TurkerController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Answer.list(params), model:[AnswerInstanceCount: Answer.count()]
    }

    def show(Answer answerInstance) {
        respond answerInstance
    }

    def create() {
        print("===============================")
        //Get Answer to anserwer
        def question = Question.findAll{ answered == false}.first()
        //Create Answer
        def newAnswer = new Answer(params)

        ["question" : question, "newAnswer": newAnswer]
    }

    @Transactional
    def save(Answer answerInstance) {
        if (answerInstance == null) {
            notFound()
            print("----------")
            return
        }

        if (answerInstance.hasErrors()) {
            print("++++++++++++++")
            respond answerInstance.errors, view:'createAnswer'
            return
        }

        answerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'answerInstance.label', default: 'Answer'), answerInstance.id])
                redirect answerInstance
            }
            '*' { respond answerInstance, [status: CREATED] }
        }
    }

    def edit(Answer answerInstance) {
        respond answerInstance
    }

    @Transactional
    def update(Answer answerInstance) {
        if (answerInstance == null) {
            notFound()
            return
        }

        if (answerInstance.hasErrors()) {
            respond answerInstance.errors, view:'edit'
            return
        }

        answerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Answer.label', default: 'Answer'), answerInstance.id])
                redirect answerInstance
            }
            '*'{ respond answerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Answer answerInstance) {

        if (answerInstance == null) {
            notFound()
            return
        }

        answerInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Answer.label', default: 'Answer'), answerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerInstance.label', default: 'Answer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
