require 'test_helper'

class FactoidInputControllerTest < ActionDispatch::IntegrationTest
  test "should get formpage" do
    get factoid_input_formpage_url
    assert_response :success
  end

end
