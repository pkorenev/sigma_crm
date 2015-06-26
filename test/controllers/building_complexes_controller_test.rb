require 'test_helper'

class BuildingComplexesControllerTest < ActionController::TestCase
  setup do
    @building_complex = building_complexes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:building_complexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create building_complex" do
    assert_difference('BuildingComplex.count') do
      post :create, building_complex: {  }
    end

    assert_redirected_to building_complex_path(assigns(:building_complex))
  end

  test "should show building_complex" do
    get :show, id: @building_complex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @building_complex
    assert_response :success
  end

  test "should update building_complex" do
    patch :update, id: @building_complex, building_complex: {  }
    assert_redirected_to building_complex_path(assigns(:building_complex))
  end

  test "should destroy building_complex" do
    assert_difference('BuildingComplex.count', -1) do
      delete :destroy, id: @building_complex
    end

    assert_redirected_to building_complexes_path
  end
end
