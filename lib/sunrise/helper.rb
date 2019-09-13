# frozen_string_literal: true

module Sunrise
  module Helper
    def html &block
      NodeBuilder.new(&block).build.to_html
    end
  end
end
