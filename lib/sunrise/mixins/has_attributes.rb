module Sunrise
  module Mixins
    module HasAttributes
      def formatted_attributes
        leading_space = attributes.empty? ? "" : " "
        formatted     = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

        "#{leading_space}#{formatted}"
      end
    end
  end
end
