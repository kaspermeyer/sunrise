# frozen_string_literal: true

module Sunrise
  module Node
    class Element
      include Mixins::HasChildren

      attr_reader :tag, :attributes

      def initialize tag, attributes = {}
        @tag        = tag
        @attributes = attributes
      end

      def to_html
        "<#{tag}#{formatted_attributes}>#{formatted_content}</#{tag}>"
      end

      private

      def formatted_content
        children.map(&:to_html).join
      end

      def formatted_attributes
        leading_space = attributes.empty? ? "" : " "
        formatted     = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

        "#{leading_space}#{formatted}"
      end
    end
  end
end
