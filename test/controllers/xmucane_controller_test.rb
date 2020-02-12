require 'test_helper'

class XmucaneControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get xmucane_home_url
    assert_response :success
  end

  test "should get about" do
    get xmucane_about_url
    assert_response :success
  end

  test "should get glyphs" do
    get xmucane_glyphs_url
    assert_response :success
  end

end
