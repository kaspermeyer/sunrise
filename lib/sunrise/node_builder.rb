# frozen_string_literal: true

module Sunrise
  # Translates the DSL into nodes
  class NodeBuilder
    attr_reader :node, :content, :children

    def initialize node = Node::Root.new, content = nil, &block
      @node     = node
      @content  = content
      @children = block || proc {}
    end

    def build
      content ? text(content) : instance_exec(&children)
      node
    end

    def method_missing tag, *options, &block
      attributes = extract_options_from(options)
      content    = options.first
      child      = NodeFactory.create(tag, attributes)

      NodeBuilder.new(child, content, &block).build

      node.add_child(child)
    end

    private

    def text literal = nil, &block
      node.add_child Node::Text.new(literal || block.call)
    end

    def tag name, *options, &block
      attributes = extract_options_from(options)
      content    = options.first
      child      = Node::Element.new(name, attributes)

      NodeBuilder.new(child, content, &block).build

      node.add_child(child)
    end

    def void name, *options, &block
      attributes = extract_options_from(options)
      content    = options.first
      child      = Node::Void.new(name, attributes)

      NodeBuilder.new(child, content, &block).build

      node.add_child(child)
    end

    def extract_options_from options
      options[-1].is_a?(Hash) ? options.pop : {}
    end
  end
end
