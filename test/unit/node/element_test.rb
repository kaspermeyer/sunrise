# frozen_string_literal: true

require "test_helper"

module Sunrise
  module Node
    class ElementTest < Sunrise::TestCase
      test "tag" do
        element = Node::Element.new :div

        assert_equal "<div></div>", element.to_html
      end

      test "attributes" do
        element = Node::Element.new :div, class: "modal"

        assert_equal "<div class=\"modal\"></div>", element.to_html
      end

      test "children" do
        element = Node::Element.new :div, class: "modal"
        element.add_child Node::Text.new("Content")

        assert_equal "<div class=\"modal\">Content</div>", element.to_html
      end
    end
  end
end
