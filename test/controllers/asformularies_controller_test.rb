require 'test_helper'

class AsformulariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asformulary = asformularies(:one)
  end

  test "should get index" do
    get asformularies_url
    assert_response :success
  end

  test "should get new" do
    get new_asformulary_url
    assert_response :success
  end

  test "should create asformulary" do
    assert_difference('Asformulary.count') do
      post asformularies_url, params: { asformulary: { apellido_materno: @asformulary.apellido_materno, apellido_paterno: @asformulary.apellido_paterno, aspcategory_id: @asformulary.aspcategory_id, codigo_obra: @asformulary.codigo_obra, descripcion: @asformulary.descripcion, estado: @asformulary.estado, nombre_atendido: @asformulary.nombre_atendido, nombre_supervisor: @asformulary.nombre_supervisor, rut_atendido: @asformulary.rut_atendido, solucion: @asformulary.solucion, subcontrato: @asformulary.subcontrato, user_id: @asformulary.user_id } }
    end

    assert_redirected_to asformulary_url(Asformulary.last)
  end

  test "should show asformulary" do
    get asformulary_url(@asformulary)
    assert_response :success
  end

  test "should get edit" do
    get edit_asformulary_url(@asformulary)
    assert_response :success
  end

  test "should update asformulary" do
    patch asformulary_url(@asformulary), params: { asformulary: { apellido_materno: @asformulary.apellido_materno, apellido_paterno: @asformulary.apellido_paterno, aspcategory_id: @asformulary.aspcategory_id, codigo_obra: @asformulary.codigo_obra, descripcion: @asformulary.descripcion, estado: @asformulary.estado, nombre_atendido: @asformulary.nombre_atendido, nombre_supervisor: @asformulary.nombre_supervisor, rut_atendido: @asformulary.rut_atendido, solucion: @asformulary.solucion, subcontrato: @asformulary.subcontrato, user_id: @asformulary.user_id } }
    assert_redirected_to asformulary_url(@asformulary)
  end

  test "should destroy asformulary" do
    assert_difference('Asformulary.count', -1) do
      delete asformulary_url(@asformulary)
    end

    assert_redirected_to asformularies_url
  end
end
