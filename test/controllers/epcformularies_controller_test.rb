require 'test_helper'

class EpcformulariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epcformulary = epcformularies(:one)
  end

  test "should get index" do
    get epcformularies_url
    assert_response :success
  end

  test "should get new" do
    get new_epcformulary_url
    assert_response :success
  end

  test "should create epcformulary" do
    assert_difference('Epcformulary.count') do
      post epcformularies_url, params: { epcformulary: { apellido_materno_pariente: @epcformulary.apellido_materno_pariente, apellido_paterno_pariente: @epcformulary.apellido_paterno_pariente, asformulary_id: @epcformulary.asformulary_id, caso_amerita_epc: @epcformulary.caso_amerita_epc, codigo: @epcformulary.codigo, codigo_obra: @epcformulary.codigo_obra, comentarios_caso: @epcformulary.comentarios_caso, derivar_a: @epcformulary.derivar_a, empresa: @epcformulary.empresa, nombre_pariente: @epcformulary.nombre_pariente, parentesco: @epcformulary.parentesco, rut_atendido: @epcformulary.rut_atendido, rut_pariente: @epcformulary.rut_pariente } }
    end

    assert_redirected_to epcformulary_url(Epcformulary.last)
  end

  test "should show epcformulary" do
    get epcformulary_url(@epcformulary)
    assert_response :success
  end

  test "should get edit" do
    get edit_epcformulary_url(@epcformulary)
    assert_response :success
  end

  test "should update epcformulary" do
    patch epcformulary_url(@epcformulary), params: { epcformulary: { apellido_materno_pariente: @epcformulary.apellido_materno_pariente, apellido_paterno_pariente: @epcformulary.apellido_paterno_pariente, asformulary_id: @epcformulary.asformulary_id, caso_amerita_epc: @epcformulary.caso_amerita_epc, codigo: @epcformulary.codigo, codigo_obra: @epcformulary.codigo_obra, comentarios_caso: @epcformulary.comentarios_caso, derivar_a: @epcformulary.derivar_a, empresa: @epcformulary.empresa, nombre_pariente: @epcformulary.nombre_pariente, parentesco: @epcformulary.parentesco, rut_atendido: @epcformulary.rut_atendido, rut_pariente: @epcformulary.rut_pariente } }
    assert_redirected_to epcformulary_url(@epcformulary)
  end

  test "should destroy epcformulary" do
    assert_difference('Epcformulary.count', -1) do
      delete epcformulary_url(@epcformulary)
    end

    assert_redirected_to epcformularies_url
  end
end
