package gturkplugintester



import grails.test.mixin.*
import spock.lang.*

@TestFor(DemographicsController)
@Mock(Demographics)
class DemographicsControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.demographicsInstanceList
        model.demographicsInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.demographicsInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def demographics = new Demographics()
        demographics.validate()
        controller.save(demographics)

        then: "The create view is rendered again with the correct model"
        model.demographicsInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        demographics = new Demographics(params)

        controller.save(demographics)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/demographics/show/1'
        controller.flash.message != null
        Demographics.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def demographics = new Demographics(params)
        controller.show(demographics)

        then: "A model is populated containing the domain instance"
        model.demographicsInstance == demographics
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def demographics = new Demographics(params)
        controller.edit(demographics)

        then: "A model is populated containing the domain instance"
        model.demographicsInstance == demographics
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/demographics/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def demographics = new Demographics()
        demographics.validate()
        controller.update(demographics)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.demographicsInstance == demographics

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        demographics = new Demographics(params).save(flush: true)
        controller.update(demographics)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/demographics/show/$demographics.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/demographics/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def demographics = new Demographics(params).save(flush: true)

        then: "It exists"
        Demographics.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(demographics)

        then: "The instance is deleted"
        Demographics.count() == 0
        response.redirectedUrl == '/demographics/index'
        flash.message != null
    }
}
