require 'test_helper'

class UniversitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => University.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    University.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    University.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to university_url(assigns(:university))
  end

  def test_edit
    get :edit, :id => University.first
    assert_template 'edit'
  end

  def test_update_invalid
    University.any_instance.stubs(:valid?).returns(false)
    put :update, :id => University.first
    assert_template 'edit'
  end

  def test_update_valid
    University.any_instance.stubs(:valid?).returns(true)
    put :update, :id => University.first
    assert_redirected_to university_url(assigns(:university))
  end

  def test_destroy
    university = University.first
    delete :destroy, :id => university
    assert_redirected_to universities_url
    assert !University.exists?(university.id)
  end
end
