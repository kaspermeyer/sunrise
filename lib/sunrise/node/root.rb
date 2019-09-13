# frozen_string_literal: true

module Sunrise
  module Node
    class Root
      include Mixins::HasChildren

      def to_html
        children.map(&:to_html).join
      end
    end
  end
end
