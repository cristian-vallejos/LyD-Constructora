require 'test_helper'

class AspcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aspcategory = aspcategories(:one)
  end

  test "should get index" do
    get aspcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_aspcategory_url
    assert_response :success
  end

  test "should create aspcategory" do
    assert_difference('Aspcategory.count') do
      post aspcategories_url, params: { aspcategory: { nombre: @aspcategory.nombre } }
    end

    assert_redirected_to aspcategory_url(Aspcategory.last)
  end

  test "should show aspcategory" do
    get aspcategory_url(@aspcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_aspcategory_url(@aspcategory)
    assert_response :success
  end

  test "should update aspcategory" do
    patch aspcategory_url(@aspcategory), params: { aspcategory: { nombre: @aspcategory.nombre } }
    assert_redirected_to aspcategory_url(@aspcategory)
  end

  test "should destroy aspcategory" do
    assert_difference('Aspcategory.count', -1) do
      delete aspcategory_url(@aspcategory)
    end

    assert_redirected_to aspcategories_url
  end
end
