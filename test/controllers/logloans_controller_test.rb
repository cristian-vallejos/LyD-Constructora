require 'test_helper'

class LogloansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logloan = logloans(:one)
  end

  test "should get index" do
    get logloans_url
    assert_response :success
  end

  test "should get new" do
    get new_logloan_url
    assert_response :success
  end

  test "should create logloan" do
    assert_difference('Logloan.count') do
      post logloans_url, params: { logloan: { cargo: @logloan.cargo, comentarios: @logloan.comentarios, estado: @logloan.estado, monto_pagado: @logloan.monto_pagado, monto_solicitado: @logloan.monto_solicitado, motivo_solicitud: @logloan.motivo_solicitud, nombre_solicitante: @logloan.nombre_solicitante, numero_cuotas: @logloan.numero_cuotas, obra: @logloan.obra, por_pagar: @logloan.por_pagar, rut_solicitante: @logloan.rut_solicitante } }
    end

    assert_redirected_to logloan_url(Logloan.last)
  end

  test "should show logloan" do
    get logloan_url(@logloan)
    assert_response :success
  end

  test "should get edit" do
    get edit_logloan_url(@logloan)
    assert_response :success
  end

  test "should update logloan" do
    patch logloan_url(@logloan), params: { logloan: { cargo: @logloan.cargo, comentarios: @logloan.comentarios, estado: @logloan.estado, monto_pagado: @logloan.monto_pagado, monto_solicitado: @logloan.monto_solicitado, motivo_solicitud: @logloan.motivo_solicitud, nombre_solicitante: @logloan.nombre_solicitante, numero_cuotas: @logloan.numero_cuotas, obra: @logloan.obra, por_pagar: @logloan.por_pagar, rut_solicitante: @logloan.rut_solicitante } }
    assert_redirected_to logloan_url(@logloan)
  end

  test "should destroy logloan" do
    assert_difference('Logloan.count', -1) do
      delete logloan_url(@logloan)
    end

    assert_redirected_to logloans_url
  end
end
