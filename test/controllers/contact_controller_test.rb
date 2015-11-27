require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get send_mail" do
    get :send_mail
    assert_response :success
  end

end
