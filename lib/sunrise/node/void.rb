# frozen_string_literal: true

module Sunrise
  module Node
    class Void < Base
      attr_reader :tag, :attributes

      def self.create tag, attributes
        new tag, attributes
      end

      def initialize tag, attributes = {}
        @tag        = tag
        @attributes = attributes
      end

      def to_html
        "<#{tag}#{formatted_attributes}>"
      end
    end
  end
end
