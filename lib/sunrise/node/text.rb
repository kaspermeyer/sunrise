# frozen_string_literal: true

module Sunrise
  module Node
    class Text
      attr_writer :text

      def initialize text = nil
        @text = text
      end

      def to_html
        @text
      end
    end
  end
end
