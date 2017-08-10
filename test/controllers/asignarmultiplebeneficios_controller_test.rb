require 'test_helper'

class AsignarmultiplebeneficiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignarmultiplebeneficio = asignarmultiplebeneficios(:one)
  end

  test "should get index" do
    get asignarmultiplebeneficios_url
    assert_response :success
  end

  test "should get new" do
    get new_asignarmultiplebeneficio_url
    assert_response :success
  end

  test "should create asignarmultiplebeneficio" do
    assert_difference('Asignarmultiplebeneficio.count') do
      post asignarmultiplebeneficios_url, params: { asignarmultiplebeneficio: { areabenefit_id: @asignarmultiplebeneficio.areabenefit_id, benefit_id: @asignarmultiplebeneficio.benefit_id, employee_id: @asignarmultiplebeneficio.employee_id, obra_id: @asignarmultiplebeneficio.obra_id } }
    end

    assert_redirected_to asignarmultiplebeneficio_url(Asignarmultiplebeneficio.last)
  end

  test "should show asignarmultiplebeneficio" do
    get asignarmultiplebeneficio_url(@asignarmultiplebeneficio)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignarmultiplebeneficio_url(@asignarmultiplebeneficio)
    assert_response :success
  end

  test "should update asignarmultiplebeneficio" do
    patch asignarmultiplebeneficio_url(@asignarmultiplebeneficio), params: { asignarmultiplebeneficio: { areabenefit_id: @asignarmultiplebeneficio.areabenefit_id, benefit_id: @asignarmultiplebeneficio.benefit_id, employee_id: @asignarmultiplebeneficio.employee_id, obra_id: @asignarmultiplebeneficio.obra_id } }
    assert_redirected_to asignarmultiplebeneficio_url(@asignarmultiplebeneficio)
  end

  test "should destroy asignarmultiplebeneficio" do
    assert_difference('Asignarmultiplebeneficio.count', -1) do
      delete asignarmultiplebeneficio_url(@asignarmultiplebeneficio)
    end

    assert_redirected_to asignarmultiplebeneficios_url
  end
end
