require 'test_helper'

class FactoidTest < ActiveSupport::TestCase
    def setup
        @fact = Factoid.new(glyph_key: "ajaw", title:"Lorem Ipsum", content:"dolor sit amet")
    end

    test "basic factoid validity" do
        assert @fact.valid?
    end

    test "glyph should be legitimate" do
        @fact.glyph_key = "xoblorf"
        assert_not @fact.valid?
    end

    test "content should exist" do
        @fact.content = ""
        assert_not @fact.valid?
    end

end
