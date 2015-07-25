require 'test_helper'

class VehicletypesControllerTest < ActionController::TestCase
  setup do
    @vehicletype = vehicletypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicletypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicletype" do
    assert_difference('Vehicletype.count') do
      post :create, vehicletype: { description: @vehicletype.description, name: @vehicletype.name }
    end

    assert_redirected_to vehicletype_path(assigns(:vehicletype))
  end

  test "should show vehicletype" do
    get :show, id: @vehicletype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicletype
    assert_response :success
  end

  test "should update vehicletype" do
    patch :update, id: @vehicletype, vehicletype: { description: @vehicletype.description, name: @vehicletype.name }
    assert_redirected_to vehicletype_path(assigns(:vehicletype))
  end

  test "should destroy vehicletype" do
    assert_difference('Vehicletype.count', -1) do
      delete :destroy, id: @vehicletype
    end

    assert_redirected_to vehicletypes_path
  end
end
