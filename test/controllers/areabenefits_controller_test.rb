require 'test_helper'

class AreabenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @areabenefit = areabenefits(:one)
  end

  test "should get index" do
    get areabenefits_url
    assert_response :success
  end

  test "should get new" do
    get new_areabenefit_url
    assert_response :success
  end

  test "should create areabenefit" do
    assert_difference('Areabenefit.count') do
      post areabenefits_url, params: { areabenefit: { nombre: @areabenefit.nombre } }
    end

    assert_redirected_to areabenefit_url(Areabenefit.last)
  end

  test "should show areabenefit" do
    get areabenefit_url(@areabenefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_areabenefit_url(@areabenefit)
    assert_response :success
  end

  test "should update areabenefit" do
    patch areabenefit_url(@areabenefit), params: { areabenefit: { nombre: @areabenefit.nombre } }
    assert_redirected_to areabenefit_url(@areabenefit)
  end

  test "should destroy areabenefit" do
    assert_difference('Areabenefit.count', -1) do
      delete areabenefit_url(@areabenefit)
    end

    assert_redirected_to areabenefits_url
  end
end
