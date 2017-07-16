require 'test_helper'

class LoanformulariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loanformulary = loanformularies(:one)
  end

  test "should get index" do
    get loanformularies_url
    assert_response :success
  end

  test "should get new" do
    get new_loanformulary_url
    assert_response :success
  end

  test "should create loanformulary" do
    assert_difference('Loanformulary.count') do
      post loanformularies_url, params: { loanformulary: { antiguedad: @loanformulary.antiguedad, cargo: @loanformulary.cargo, comentarios: @loanformulary.comentarios, continuidad_en_obra: @loanformulary.continuidad_en_obra, descripcion_documentos_respaldo: @loanformulary.descripcion_documentos_respaldo, descuentos_en_curso: @loanformulary.descuentos_en_curso, fecha_ultimo_contrato: @loanformulary.fecha_ultimo_contrato, fondo_finiquito: @loanformulary.fondo_finiquito, monto_aprobado: @loanformulary.monto_aprobado, monto_cuota: @loanformulary.monto_cuota, monto_solicitado: @loanformulary.monto_solicitado, motivo_solicitud: @loanformulary.motivo_solicitud, nombre_solicitante: @loanformulary.nombre_solicitante, numero_cuotas: @loanformulary.numero_cuotas, obra: @loanformulary.obra, renta_liquida: @loanformulary.renta_liquida, rut_solicitante: @loanformulary.rut_solicitante } }
    end

    assert_redirected_to loanformulary_url(Loanformulary.last)
  end

  test "should show loanformulary" do
    get loanformulary_url(@loanformulary)
    assert_response :success
  end

  test "should get edit" do
    get edit_loanformulary_url(@loanformulary)
    assert_response :success
  end

  test "should update loanformulary" do
    patch loanformulary_url(@loanformulary), params: { loanformulary: { antiguedad: @loanformulary.antiguedad, cargo: @loanformulary.cargo, comentarios: @loanformulary.comentarios, continuidad_en_obra: @loanformulary.continuidad_en_obra, descripcion_documentos_respaldo: @loanformulary.descripcion_documentos_respaldo, descuentos_en_curso: @loanformulary.descuentos_en_curso, fecha_ultimo_contrato: @loanformulary.fecha_ultimo_contrato, fondo_finiquito: @loanformulary.fondo_finiquito, monto_aprobado: @loanformulary.monto_aprobado, monto_cuota: @loanformulary.monto_cuota, monto_solicitado: @loanformulary.monto_solicitado, motivo_solicitud: @loanformulary.motivo_solicitud, nombre_solicitante: @loanformulary.nombre_solicitante, numero_cuotas: @loanformulary.numero_cuotas, obra: @loanformulary.obra, renta_liquida: @loanformulary.renta_liquida, rut_solicitante: @loanformulary.rut_solicitante } }
    assert_redirected_to loanformulary_url(@loanformulary)
  end

  test "should destroy loanformulary" do
    assert_difference('Loanformulary.count', -1) do
      delete loanformulary_url(@loanformulary)
    end

    assert_redirected_to loanformularies_url
  end
end
