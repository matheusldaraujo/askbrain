package askbrain

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK


class TurkerController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        print("Turker Controller: index")
        params.max = Math.min(max ?: 10, 100)
        respond Answer.list(params), model:[AnswerInstanceCount: Answer.count()]
    }

    def show(Answer answerInstance) {
        print("Turker Controller: show")
        respond answerInstance
    }

    def createAskHit() {
        print("Turker Controller: createAskHit")
        //Get Answer to anserwer
        def question = Question.findAll{ answered == false}.first()

        ["question" : question]
    }

    def createMixerHit() {
        print("Turker Controller: createMixerHit")
        //Get Answer to anserwer
        def question = Question.findByAnsweredAndMixed(true,false)

        ["question" : question, "answers": question.getAnswers()]
    }

    def createRankerHit() {
        print("Turker Controller: createRankerHit")
        //Get Answer to anserwer
        def question = Question.findByAnsweredAndMixedAndRanked(true,true,false)

        ["question" : question, "mixedAnswers": question.getMixedAnswers()]
    }

    @Transactional
    def save(Answer answerInstance) {
        print("Turker Controller: save")
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
        print("Turker Controller: edit")
        respond answerInstance
    }

    @Transactional
    def update(Answer answerInstance) {
        print("Turker Controller: update")
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
        print("Turker Controller: delete")
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
        print("Turker Controller: notFound")
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerInstance.label', default: 'Answer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
