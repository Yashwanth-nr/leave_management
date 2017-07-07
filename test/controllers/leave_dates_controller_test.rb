require 'test_helper'

class LeaveDatesControllerTest < ActionController::TestCase
  setup do
    @leave_date = leave_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_date" do
    assert_difference('LeaveDate.count') do
      post :create, leave_date: { leave_date: @leave_date.leave_date, leave_id: @leave_date.leave_id, leave_type: @leave_date.leave_type }
    end

    assert_redirected_to leave_date_path(assigns(:leave_date))
  end

  test "should show leave_date" do
    get :show, id: @leave_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_date
    assert_response :success
  end

  test "should update leave_date" do
    patch :update, id: @leave_date, leave_date: { leave_date: @leave_date.leave_date, leave_id: @leave_date.leave_id, leave_type: @leave_date.leave_type }
    assert_redirected_to leave_date_path(assigns(:leave_date))
  end

  test "should destroy leave_date" do
    assert_difference('LeaveDate.count', -1) do
      delete :destroy, id: @leave_date
    end

    assert_redirected_to leave_dates_path
  end
end
