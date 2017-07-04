require 'test_helper'

class BenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefit = benefits(:one)
  end

  test "should get index" do
    get benefits_url
    assert_response :success
  end

  test "should get new" do
    get new_benefit_url
    assert_response :success
  end

  test "should create benefit" do
    assert_difference('Benefit.count') do
      post benefits_url, params: { benefit: { area: @benefit.area, costoempresa: @benefit.costoempresa, costotrabajador: @benefit.costotrabajador, nombre: @benefit.nombre } }
    end

    assert_redirected_to benefit_url(Benefit.last)
  end

  test "should show benefit" do
    get benefit_url(@benefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_benefit_url(@benefit)
    assert_response :success
  end

  test "should update benefit" do
    patch benefit_url(@benefit), params: { benefit: { area: @benefit.area, costoempresa: @benefit.costoempresa, costotrabajador: @benefit.costotrabajador, nombre: @benefit.nombre } }
    assert_redirected_to benefit_url(@benefit)
  end

  test "should destroy benefit" do
    assert_difference('Benefit.count', -1) do
      delete benefit_url(@benefit)
    end

    assert_redirected_to benefits_url
  end
end
