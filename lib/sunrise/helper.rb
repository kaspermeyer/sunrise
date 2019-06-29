module Sunrise
  module Helper
    def html &code
      instance_exec &code if block_given?
    end

    private

      def method_missing html_tag, *html_tag_attributes, &code
        return html_tag_attributes.first.to_s if html_tag == :text

        html = add_opening html_tag
        html.insert -2, add_provided(html_tag_attributes) unless html_tag_attributes.empty?
        html.concat yield if block_given?
        html.concat add_closing html_tag
      end

      def add_opening html_tag
        "<#{html_tag}>"
      end

      def add_provided html_tag_attributes
        attributes_list = html_tag_attributes.first.map do |name, value|
          add_attribute name, value
        end.reduce(&:concat)
      end

      def add_attribute name, value
        " " + name.to_s + "=\"" + value.to_s + "\""
      end

      def add_closing html_tag
        "</#{html_tag}>"
      end
  end
end
