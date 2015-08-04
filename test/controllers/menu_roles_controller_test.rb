require 'test_helper'

class MenuRolesControllerTest < ActionController::TestCase
  setup do
    @menu_role = menu_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_role" do
    assert_difference('MenuRole.count') do
      post :create, menu_role: { icon: @menu_role.icon, link: @menu_role.link, name: @menu_role.name, role_id: @menu_role.role_id }
    end

    assert_redirected_to menu_role_path(assigns(:menu_role))
  end

  test "should show menu_role" do
    get :show, id: @menu_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_role
    assert_response :success
  end

  test "should update menu_role" do
    patch :update, id: @menu_role, menu_role: { icon: @menu_role.icon, link: @menu_role.link, name: @menu_role.name, role_id: @menu_role.role_id }
    assert_redirected_to menu_role_path(assigns(:menu_role))
  end

  test "should destroy menu_role" do
    assert_difference('MenuRole.count', -1) do
      delete :destroy, id: @menu_role
    end

    assert_redirected_to menu_roles_path
  end
end
