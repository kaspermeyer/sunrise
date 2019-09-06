# frozen_string_literal: true

module Sunrise
  module Helper
    def html(&block)
      instance_exec(&block)
    end
    %i[a].each do |block_word|
      define_method(block_word) do |arg, &block|
        return "<#{block_word} #{hash_html(arg)}>#{block.nil? ? '' : block.call}</#{block_word}>"
      end
    end
    %i[div span].each do |block_word|
      define_method(block_word) do |&block|
        return "<#{block_word}>#{block.nil? ? '' : block.call}</#{block_word}>"
      end
    end

    %i[text].each do |function_word|
      define_method(function_word) do |arg|
        return arg.to_s
      end
    end

    private

      def hash_html(hash)
        hash.map { |key, value| (key.to_s + '="' + value.to_s + '"') }.join(" ")
      end
  end
end
