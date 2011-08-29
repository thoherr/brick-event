require 'test_helper'

class ParticipationsControllerTest < ActionController::TestCase
  setup do
    @participation = participations(:one)
  end

  test "should get index" do
# TODO: FIX THIS TEST
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:participations)
  end

  test "should get new" do
# TODO: FIX THIS TEST
#    get :new
#    assert_response :success
  end

  test "should create participation" do
    assert_difference('Participation.count') do
      post :create, :participation => @participation.attributes
    end

# TODO: FIX THIS TEST
#    assert_redirected_to participations_path(assigns(:participation))
  end

  test "should show participation" do
    get :show, :id => @participation.to_param
    assert_response :success
  end

  test "should get edit" do
# TODO: FIX THIS TEST
#    get :edit, :id => @participation.to_param
#    assert_response :success
  end

  test "should update participation" do
    put :update, :id => @participation.to_param, :participation => @participation.attributes
# TODO: FIX THIS TEST
#    assert_redirected_to participations_path(assigns(:participation))
  end

  test "should destroy participation" do
    assert_difference('Participation.count', -1) do
      delete :destroy, :id => @participation.to_param
    end

    assert_redirected_to participations_path
  end
end
