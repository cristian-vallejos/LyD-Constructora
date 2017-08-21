require 'test_helper'

class FamiliartrabajadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @familiartrabajador = familiartrabajadors(:one)
  end

  test "should get index" do
    get familiartrabajadors_url
    assert_response :success
  end

  test "should get new" do
    get new_familiartrabajador_url
    assert_response :success
  end

  test "should create familiartrabajador" do
    assert_difference('Familiartrabajador.count') do
      post familiartrabajadors_url, params: { familiartrabajador: { fechanacimiento: @familiartrabajador.fechanacimiento, nombre: @familiartrabajador.nombre, relacion: @familiartrabajador.relacion, rut: @familiartrabajador.rut, rut_trabajador: @familiartrabajador.rut_trabajador } }
    end

    assert_redirected_to familiartrabajador_url(Familiartrabajador.last)
  end

  test "should show familiartrabajador" do
    get familiartrabajador_url(@familiartrabajador)
    assert_response :success
  end

  test "should get edit" do
    get edit_familiartrabajador_url(@familiartrabajador)
    assert_response :success
  end

  test "should update familiartrabajador" do
    patch familiartrabajador_url(@familiartrabajador), params: { familiartrabajador: { fechanacimiento: @familiartrabajador.fechanacimiento, nombre: @familiartrabajador.nombre, relacion: @familiartrabajador.relacion, rut: @familiartrabajador.rut, rut_trabajador: @familiartrabajador.rut_trabajador } }
    assert_redirected_to familiartrabajador_url(@familiartrabajador)
  end

  test "should destroy familiartrabajador" do
    assert_difference('Familiartrabajador.count', -1) do
      delete familiartrabajador_url(@familiartrabajador)
    end

    assert_redirected_to familiartrabajadors_url
  end
end
