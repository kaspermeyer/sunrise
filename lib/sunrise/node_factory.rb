# frozen_string_literal: true

module Sunrise
  class NodeFactory
    ELEMENT_TAGS = [
      :a,
      :button,
      :div,
      :span,
      :h1
    ].freeze

    VOID_TAGS = [
      :input,
      :img,
      :br,
      :hr,
    ].freeze

    TAG_MAPPER = {
      ELEMENT_TAGS => Node::Element,
      VOID_TAGS    => Node::Void
    }

    def self.create(tag, attributes)
      key = TAG_MAPPER.keys.find { |list| list.include?(tag) }
      TAG_MAPPER[key].new(tag, attributes)
    end
  end
end
