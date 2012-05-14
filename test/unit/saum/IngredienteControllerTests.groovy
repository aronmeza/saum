package saum



import org.junit.*
import grails.test.mixin.*

@TestFor(IngredienteController)
@Mock(Ingrediente)
class IngredienteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ingrediente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ingredienteInstanceList.size() == 0
        assert model.ingredienteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ingredienteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ingredienteInstance != null
        assert view == '/ingrediente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ingrediente/show/1'
        assert controller.flash.message != null
        assert Ingrediente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'


        populateValidParams(params)
        def ingrediente = new Ingrediente(params)

        assert ingrediente.save() != null

        params.id = ingrediente.id

        def model = controller.show()

        assert model.ingredienteInstance == ingrediente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'


        populateValidParams(params)
        def ingrediente = new Ingrediente(params)

        assert ingrediente.save() != null

        params.id = ingrediente.id

        def model = controller.edit()

        assert model.ingredienteInstance == ingrediente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'

        response.reset()


        populateValidParams(params)
        def ingrediente = new Ingrediente(params)

        assert ingrediente.save() != null

        // test invalid parameters in update
        params.id = ingrediente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ingrediente/edit"
        assert model.ingredienteInstance != null

        ingrediente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ingrediente/show/$ingrediente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ingrediente.clearErrors()

        populateValidParams(params)
        params.id = ingrediente.id
        params.version = -1
        controller.update()

        assert view == "/ingrediente/edit"
        assert model.ingredienteInstance != null
        assert model.ingredienteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'

        response.reset()

        populateValidParams(params)
        def ingrediente = new Ingrediente(params)

        assert ingrediente.save() != null
        assert Ingrediente.count() == 1

        params.id = ingrediente.id

        controller.delete()

        assert Ingrediente.count() == 0
        assert Ingrediente.get(ingrediente.id) == null
        assert response.redirectedUrl == '/ingrediente/list'
    }
}
