require 'test_helper'

class AccommodationsControllerTest < ActionController::TestCase
  setup do
    @accommodation = accommodations(:one)
    attendance = attendances(:one)
    @accommodation.attendance = attendance
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accommodations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post :create, :accommodation => @accommodation.attributes
    end

    assert_redirected_to attendance_path(assigns(:accommodation).attendance)
  end

  test "should show accommodation" do
    get :show, :id => @accommodation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accommodation.to_param
    assert_response :success
  end

  test "should update accommodation" do
    put :update, :id => @accommodation.to_param, :accommodation => @accommodation.attributes
    assert_redirected_to attendance_path(assigns(:accommodation).attendance)
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete :destroy, :id => @accommodation.to_param
    end

    assert_redirected_to accommodations_path
  end
end
