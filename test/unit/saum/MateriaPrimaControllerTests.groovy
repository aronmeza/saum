package saum



import org.junit.*
import grails.test.mixin.*

@TestFor(MateriaPrimaController)
@Mock(MateriaPrima)
class MateriaPrimaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/materiaPrima/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materiaPrimaInstanceList.size() == 0
        assert model.materiaPrimaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.materiaPrimaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materiaPrimaInstance != null
        assert view == '/materiaPrima/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/materiaPrima/show/1'
        assert controller.flash.message != null
        assert MateriaPrima.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'


        populateValidParams(params)
        def materiaPrima = new MateriaPrima(params)

        assert materiaPrima.save() != null

        params.id = materiaPrima.id

        def model = controller.show()

        assert model.materiaPrimaInstance == materiaPrima
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'


        populateValidParams(params)
        def materiaPrima = new MateriaPrima(params)

        assert materiaPrima.save() != null

        params.id = materiaPrima.id

        def model = controller.edit()

        assert model.materiaPrimaInstance == materiaPrima
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'

        response.reset()


        populateValidParams(params)
        def materiaPrima = new MateriaPrima(params)

        assert materiaPrima.save() != null

        // test invalid parameters in update
        params.id = materiaPrima.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/materiaPrima/edit"
        assert model.materiaPrimaInstance != null

        materiaPrima.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/materiaPrima/show/$materiaPrima.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        materiaPrima.clearErrors()

        populateValidParams(params)
        params.id = materiaPrima.id
        params.version = -1
        controller.update()

        assert view == "/materiaPrima/edit"
        assert model.materiaPrimaInstance != null
        assert model.materiaPrimaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'

        response.reset()

        populateValidParams(params)
        def materiaPrima = new MateriaPrima(params)

        assert materiaPrima.save() != null
        assert MateriaPrima.count() == 1

        params.id = materiaPrima.id

        controller.delete()

        assert MateriaPrima.count() == 0
        assert MateriaPrima.get(materiaPrima.id) == null
        assert response.redirectedUrl == '/materiaPrima/list'
    }
}
