# -*- encoding : utf-8 -*-
require 'test_helper'

class InterestsControllerTest < ActionController::TestCase
  setup do
    @interest = interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interest" do
    assert_difference('Interest.count') do
      post :create, :interest => @interest.attributes
    end

    assert_redirected_to interest_path(assigns(:interest))
  end

  test "should show interest" do
    get :show, :id => @interest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @interest.to_param
    assert_response :success
  end

  test "should update interest" do
    put :update, :id => @interest.to_param, :interest => @interest.attributes
    assert_redirected_to interest_path(assigns(:interest))
  end

  test "should destroy interest" do
    assert_difference('Interest.count', -1) do
      delete :destroy, :id => @interest.to_param
    end

    assert_redirected_to interests_path
  end
end
