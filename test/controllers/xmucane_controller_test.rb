require 'test_helper'

class XmucaneControllerTest < ActionDispatch::IntegrationTest

    def setup
        @base_title = "Xmucane"
    end

    test "should get home" do
        get home_url
        assert_response :success
        assert_select "title", "#{@base_title}", 'title incorrect'
        refute_nil assigns(:mayan_date), 'mayan date object absent'
    end

    test "should get about" do
        get about_url
        assert_response :success
        assert_select "title", "About - #{@base_title}"
    end

    test "should get glyphs" do
        get glyphs_url
        assert_response :success
        assert_select "title", "Glyphs - #{@base_title}"
    end

end
