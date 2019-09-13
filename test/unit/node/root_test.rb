# frozen_string_literal: true

require "test_helper"

module Sunrise
  module Node
    class RootTest < Sunrise::TestCase
      test "contains no markup in itself" do
        root = Node::Root.new

        assert_equal "", root.to_html
      end

      test "concatenating children" do
        root = Node::Root.new
        root.add_child Node::Text.new("Content")
        root.add_child Node::Element.new(:div)

        assert_equal "Content<div></div>", root.to_html
      end
    end
  end
end
