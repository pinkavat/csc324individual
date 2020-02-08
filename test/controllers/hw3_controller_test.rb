require 'test_helper'

class Hw3ControllerTest < ActionDispatch::IntegrationTest

    def setup
        @base_title = "Homework 3 Site"
    end

    test "should get root" do
        get root_path
        assert_response :success
    end

    test "should get home" do
        get home_path
        assert_response :success
        assert_select "title", "Home - #{@base_title}"
    end

    test "should get about" do
        get about_path
        assert_response :success
        assert_select "title", "About - #{@base_title}"
    end

    test "should get faq" do
        get faq_path
        assert_response :success
        assert_select "title", "Frequently Asked Questions - #{@base_title}"
    end

end
