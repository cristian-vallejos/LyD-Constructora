require 'test_helper'

class LogasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loga = logas(:one)
  end

  test "should get index" do
    get logas_url
    assert_response :success
  end

  test "should get new" do
    get new_loga_url
    assert_response :success
  end

  test "should create loga" do
    assert_difference('Loga.count') do
      post logas_url, params: { loga: { apellido_materno_atendido: @loga.apellido_materno_atendido, apellido_materno_pariente: @loga.apellido_materno_pariente, apellido_paterno_atendido: @loga.apellido_paterno_atendido, apellido_paterno_pariente: @loga.apellido_paterno_pariente, asocial_id: @loga.asocial_id, aspcategory_name: @loga.aspcategory_name, caso_amerita_epc: @loga.caso_amerita_epc, codigo_obra: @loga.codigo_obra, comentarios_caso: @loga.comentarios_caso, derivar_a: @loga.derivar_a, descripcion: @loga.descripcion, empresa: @loga.empresa, epcformulary_id: @loga.epcformulary_id, estado: @loga.estado, nombre_atendido: @loga.nombre_atendido, nombre_pariente: @loga.nombre_pariente, parentezco: @loga.parentezco, rut_atendido: @loga.rut_atendido, rut_pariente: @loga.rut_pariente, solucion: @loga.solucion, subcontrato: @loga.subcontrato, supervisor: @loga.supervisor, user_name: @loga.user_name } }
    end

    assert_redirected_to loga_url(Loga.last)
  end

  test "should show loga" do
    get loga_url(@loga)
    assert_response :success
  end

  test "should get edit" do
    get edit_loga_url(@loga)
    assert_response :success
  end

  test "should update loga" do
    patch loga_url(@loga), params: { loga: { apellido_materno_atendido: @loga.apellido_materno_atendido, apellido_materno_pariente: @loga.apellido_materno_pariente, apellido_paterno_atendido: @loga.apellido_paterno_atendido, apellido_paterno_pariente: @loga.apellido_paterno_pariente, asocial_id: @loga.asocial_id, aspcategory_name: @loga.aspcategory_name, caso_amerita_epc: @loga.caso_amerita_epc, codigo_obra: @loga.codigo_obra, comentarios_caso: @loga.comentarios_caso, derivar_a: @loga.derivar_a, descripcion: @loga.descripcion, empresa: @loga.empresa, epcformulary_id: @loga.epcformulary_id, estado: @loga.estado, nombre_atendido: @loga.nombre_atendido, nombre_pariente: @loga.nombre_pariente, parentezco: @loga.parentezco, rut_atendido: @loga.rut_atendido, rut_pariente: @loga.rut_pariente, solucion: @loga.solucion, subcontrato: @loga.subcontrato, supervisor: @loga.supervisor, user_name: @loga.user_name } }
    assert_redirected_to loga_url(@loga)
  end

  test "should destroy loga" do
    assert_difference('Loga.count', -1) do
      delete loga_url(@loga)
    end

    assert_redirected_to logas_url
  end
end
