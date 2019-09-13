module Sunrise
  module Mixins
    module HasChildren
      def add_child child
        children << child
      end

      def children
        @children ||= []
      end
    end
  end
end
