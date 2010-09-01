require 'test_helper'

class TransformerInformationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TransformerInformation.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TransformerInformation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TransformerInformation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to transformer_information_url(assigns(:transformer_information))
  end
  
  def test_edit
    get :edit, :id => TransformerInformation.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TransformerInformation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TransformerInformation.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TransformerInformation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TransformerInformation.first
    assert_redirected_to transformer_information_url(assigns(:transformer_information))
  end
  
  def test_destroy
    transformer_information = TransformerInformation.first
    delete :destroy, :id => transformer_information
    assert_redirected_to transformer_informations_url
    assert !TransformerInformation.exists?(transformer_information.id)
  end
end
