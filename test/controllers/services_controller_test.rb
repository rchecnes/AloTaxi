require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, service: { address_id: @service.address_id, address_id: @service.address_id, cancelled_at: @service.cancelled_at, confirmed_at_datetime: @service.confirmed_at_datetime, ended_at: @service.ended_at, payment_type_id: @service.payment_type_id, person_id: @service.person_id, person_id: @service.person_id, phase: @service.phase, price_double: @service.price_double, requested_to: @service.requested_to, reserved_at: @service.reserved_at, scheduled_to: @service.scheduled_to, service_type_id: @service.service_type_id, started_at: @service.started_at, vehicle_id: @service.vehicle_id }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update service" do
    patch :update, id: @service, service: { address_id: @service.address_id, address_id: @service.address_id, cancelled_at: @service.cancelled_at, confirmed_at_datetime: @service.confirmed_at_datetime, ended_at: @service.ended_at, payment_type_id: @service.payment_type_id, person_id: @service.person_id, person_id: @service.person_id, phase: @service.phase, price_double: @service.price_double, requested_to: @service.requested_to, reserved_at: @service.reserved_at, scheduled_to: @service.scheduled_to, service_type_id: @service.service_type_id, started_at: @service.started_at, vehicle_id: @service.vehicle_id }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
