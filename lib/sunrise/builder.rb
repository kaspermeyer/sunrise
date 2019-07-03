module Sunrise
  class Builder
    TAGS = %i[div span a].freeze

    def initialize &block
      @content = block
    end

    def to_html
      instance_exec(&@content)
    end

    def method_missing tag, *args, &block
      return super unless TAGS.include?(tag)

      attributes = format_attributes(*args)
      content    = instance_exec(&block) if block_given?

      "<#{tag}#{attributes}>#{content}</#{tag}>"
    end

    def respond_to? tag
      TAGS.include?(tag) ? true : super
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
