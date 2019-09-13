# frozen_string_literal: true

require "test_helper"

module Sunrise
  class NodeBuilderTest < Sunrise::TestCase
    test "building a nested structure with siblings" do
      builder = NodeBuilder.new do
        div do
          span
        end
        div
      end

      assert_equal "<div><span></span></div><div></div>", builder.build.to_html
    end

    test "building an explicit node" do
      node = Node::Element.new :div

      builder = NodeBuilder.new(node) do
        text "Content"
      end

      assert_equal "<div>Content</div>", builder.build.to_html
    end
  end
end
