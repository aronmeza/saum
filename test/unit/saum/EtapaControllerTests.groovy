package saum



import org.junit.*
import grails.test.mixin.*

@TestFor(EtapaController)
@Mock(Etapa)
class EtapaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/etapa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.etapaInstanceList.size() == 0
        assert model.etapaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.etapaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.etapaInstance != null
        assert view == '/etapa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/etapa/show/1'
        assert controller.flash.message != null
        assert Etapa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/etapa/list'


        populateValidParams(params)
        def etapa = new Etapa(params)

        assert etapa.save() != null

        params.id = etapa.id

        def model = controller.show()

        assert model.etapaInstance == etapa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/etapa/list'


        populateValidParams(params)
        def etapa = new Etapa(params)

        assert etapa.save() != null

        params.id = etapa.id

        def model = controller.edit()

        assert model.etapaInstance == etapa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/etapa/list'

        response.reset()


        populateValidParams(params)
        def etapa = new Etapa(params)

        assert etapa.save() != null

        // test invalid parameters in update
        params.id = etapa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/etapa/edit"
        assert model.etapaInstance != null

        etapa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/etapa/show/$etapa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        etapa.clearErrors()

        populateValidParams(params)
        params.id = etapa.id
        params.version = -1
        controller.update()

        assert view == "/etapa/edit"
        assert model.etapaInstance != null
        assert model.etapaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/etapa/list'

        response.reset()

        populateValidParams(params)
        def etapa = new Etapa(params)

        assert etapa.save() != null
        assert Etapa.count() == 1

        params.id = etapa.id

        controller.delete()

        assert Etapa.count() == 0
        assert Etapa.get(etapa.id) == null
        assert response.redirectedUrl == '/etapa/list'
    }
}
