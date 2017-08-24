require 'test_helper'

class LogbenefitsfinalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logbenefitsfinal = logbenefitsfinals(:one)
  end

  test "should get index" do
    get logbenefitsfinals_url
    assert_response :success
  end

  test "should get new" do
    get new_logbenefitsfinal_url
    assert_response :success
  end

  test "should create logbenefitsfinal" do
    assert_difference('Logbenefitsfinal.count') do
      post logbenefitsfinals_url, params: { logbenefitsfinal: { Idasignacionbeneficio: @logbenefitsfinal.Idasignacionbeneficio, areabeneficio: @logbenefitsfinal.areabeneficio, asistebeneficio: @logbenefitsfinal.asistebeneficio, costoempresa: @logbenefitsfinal.costoempresa, costotrabajador: @logbenefitsfinal.costotrabajador, nombrebeneficio: @logbenefitsfinal.nombrebeneficio, nombreobra: @logbenefitsfinal.nombreobra, nombretrabajador: @logbenefitsfinal.nombretrabajador, relacion: @logbenefitsfinal.relacion, rutbeneficiario: @logbenefitsfinal.rutbeneficiario, ruttrabajador: @logbenefitsfinal.ruttrabajador } }
    end

    assert_redirected_to logbenefitsfinal_url(Logbenefitsfinal.last)
  end

  test "should show logbenefitsfinal" do
    get logbenefitsfinal_url(@logbenefitsfinal)
    assert_response :success
  end

  test "should get edit" do
    get edit_logbenefitsfinal_url(@logbenefitsfinal)
    assert_response :success
  end

  test "should update logbenefitsfinal" do
    patch logbenefitsfinal_url(@logbenefitsfinal), params: { logbenefitsfinal: { Idasignacionbeneficio: @logbenefitsfinal.Idasignacionbeneficio, areabeneficio: @logbenefitsfinal.areabeneficio, asistebeneficio: @logbenefitsfinal.asistebeneficio, costoempresa: @logbenefitsfinal.costoempresa, costotrabajador: @logbenefitsfinal.costotrabajador, nombrebeneficio: @logbenefitsfinal.nombrebeneficio, nombreobra: @logbenefitsfinal.nombreobra, nombretrabajador: @logbenefitsfinal.nombretrabajador, relacion: @logbenefitsfinal.relacion, rutbeneficiario: @logbenefitsfinal.rutbeneficiario, ruttrabajador: @logbenefitsfinal.ruttrabajador } }
    assert_redirected_to logbenefitsfinal_url(@logbenefitsfinal)
  end

  test "should destroy logbenefitsfinal" do
    assert_difference('Logbenefitsfinal.count', -1) do
      delete logbenefitsfinal_url(@logbenefitsfinal)
    end

    assert_redirected_to logbenefitsfinals_url
  end
end
