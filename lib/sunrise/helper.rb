module Sunrise
  module Helper
    def html &block
      Builder.new(&block).to_html
    end
  end
end
