package saum



import org.junit.*
import grails.test.mixin.*

@TestFor(RecetaController)
@Mock(Receta)
class RecetaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/receta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.recetaInstanceList.size() == 0
        assert model.recetaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.recetaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.recetaInstance != null
        assert view == '/receta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/receta/show/1'
        assert controller.flash.message != null
        assert Receta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'


        populateValidParams(params)
        def receta = new Receta(params)

        assert receta.save() != null

        params.id = receta.id

        def model = controller.show()

        assert model.recetaInstance == receta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'


        populateValidParams(params)
        def receta = new Receta(params)

        assert receta.save() != null

        params.id = receta.id

        def model = controller.edit()

        assert model.recetaInstance == receta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'

        response.reset()


        populateValidParams(params)
        def receta = new Receta(params)

        assert receta.save() != null

        // test invalid parameters in update
        params.id = receta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/receta/edit"
        assert model.recetaInstance != null

        receta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/receta/show/$receta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        receta.clearErrors()

        populateValidParams(params)
        params.id = receta.id
        params.version = -1
        controller.update()

        assert view == "/receta/edit"
        assert model.recetaInstance != null
        assert model.recetaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'

        response.reset()

        populateValidParams(params)
        def receta = new Receta(params)

        assert receta.save() != null
        assert Receta.count() == 1

        params.id = receta.id

        controller.delete()

        assert Receta.count() == 0
        assert Receta.get(receta.id) == null
        assert response.redirectedUrl == '/receta/list'
    }
}
