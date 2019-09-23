# frozen_string_literal: true

module Sunrise
  module Node
    class Root < Base
      def to_html
        children.map(&:to_html).join
      end
    end
  end
end
