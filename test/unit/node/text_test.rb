# frozen_string_literal: true

require "test_helper"

module Sunrise
  module Node
    class TextTest < Sunrise::TestCase
      test "text content" do
        text = Node::Text.new "Text"

        assert_equal "Text", text.to_html
      end
    end
  end
end
