require 'test_helper'

class AssignbenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignbenefit = assignbenefits(:one)
  end

  test "should get index" do
    get assignbenefits_url
    assert_response :success
  end

  test "should get new" do
    get new_assignbenefit_url
    assert_response :success
  end

  test "should create assignbenefit" do
    assert_difference('Assignbenefit.count') do
      post assignbenefits_url, params: { assignbenefit: { benefit_id: @assignbenefit.benefit_id, fecha_nacimiento: @assignbenefit.fecha_nacimiento, obra_id: @assignbenefit.obra_id, relacion: @assignbenefit.relacion, rut_beneficiario: @assignbenefit.rut_beneficiario, rut_trabajador: @assignbenefit.rut_trabajador } }
    end

    assert_redirected_to assignbenefit_url(Assignbenefit.last)
  end

  test "should show assignbenefit" do
    get assignbenefit_url(@assignbenefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignbenefit_url(@assignbenefit)
    assert_response :success
  end

  test "should update assignbenefit" do
    patch assignbenefit_url(@assignbenefit), params: { assignbenefit: { benefit_id: @assignbenefit.benefit_id, fecha_nacimiento: @assignbenefit.fecha_nacimiento, obra_id: @assignbenefit.obra_id, relacion: @assignbenefit.relacion, rut_beneficiario: @assignbenefit.rut_beneficiario, rut_trabajador: @assignbenefit.rut_trabajador } }
    assert_redirected_to assignbenefit_url(@assignbenefit)
  end

  test "should destroy assignbenefit" do
    assert_difference('Assignbenefit.count', -1) do
      delete assignbenefit_url(@assignbenefit)
    end

    assert_redirected_to assignbenefits_url
  end
end
