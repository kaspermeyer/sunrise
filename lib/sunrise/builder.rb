module Sunrise
  class Builder
    TAGS = %i[div span a].freeze

    def initialize &block
      @content = block
    end

    def to_html
      instance_exec(&@content)
    end

    def method_missing name, *args, &block
      if TAGS.include?(name)
        "<#{name}#{format_attributes(*args)}>#{instance_exec(&block) if block_given?}</#{name}>"
      else
        super
      end
    end

    def respond_to? name
      TAGS.include?(name) ? true : super
    end

    private

      def text content
        content
      end

      def format_attributes attributes = {}
        leading_space = attributes.empty? ? "" : " "
        formatted     = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

        "#{leading_space}#{formatted}"
      end
  end
end
