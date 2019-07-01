module Sunrise
  class Builder
    TAGS = %i[div span a button].freeze

    def initialize &block
      @content = block
    end

    def to_html
      instance_exec(&@content)
    end

    def method_missing name, *args, &block
      attributes = format_attributes extract_options!(args)
      content    = args.first || instance_exec(&(block || -> {}))

      TAGS.include?(name) ? "<#{name}#{attributes}>#{content}</#{name}>" : super
    end

    def respond_to? name
      TAGS.include?(name) ? true : super
    end

    private

      def text content = nil, &block
        content or instance_exec(&block)
      end

      def format_attributes attributes = {}
        leading_space = attributes.empty? ? "" : " "
        formatted     = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

        "#{leading_space}#{formatted}"
      end

      def extract_options! options
        options[-1].is_a?(::Hash) ? options.pop : {}
      end
  end
end
