# frozen_string_literal: true

module Sunrise
  module Node
    class Element < Base
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
    end
  end
end
