require 'test_helper'

class InmediateServicesControllerTest < ActionController::TestCase
  setup do
    @inmediate_service = inmediate_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inmediate_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inmediate_service" do
    assert_difference('InmediateService.count') do
      post :create, inmediate_service: { name: @inmediate_service.name }
    end

    assert_redirected_to inmediate_service_path(assigns(:inmediate_service))
  end

  test "should show inmediate_service" do
    get :show, id: @inmediate_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inmediate_service
    assert_response :success
  end

  test "should update inmediate_service" do
    patch :update, id: @inmediate_service, inmediate_service: { name: @inmediate_service.name }
    assert_redirected_to inmediate_service_path(assigns(:inmediate_service))
  end

  test "should destroy inmediate_service" do
    assert_difference('InmediateService.count', -1) do
      delete :destroy, id: @inmediate_service
    end

    assert_redirected_to inmediate_services_path
  end
end
