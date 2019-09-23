# frozen_string_literal: true

module Sunrise
  module Node
    class Base
      attr_reader :attributes

      def add_child child
        children << child
      end

      def children
        @children ||= []
      end

      def to_html
        ""
      end

      private

      def formatted_attributes
        leading_space = attributes.empty? ? "" : " "
        formatted     = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

        "#{leading_space}#{formatted}"
      end
    end
  end
end
