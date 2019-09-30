# frozen_string_literal: true

require "test_helper"

class Week5Test < Sunrise::TestCase
  include Sunrise::Helper

  test "custom element with content" do
    expected_output = <<~HTML
      <blog-post v-for="post in posts" title="Vue component">
        <h1>Vue component</h1>
      </blog-post>
    HTML

    output = html do
      tag "blog-post", "v-for" => "post in posts", "title" => "Vue component" do
        h1 "Vue component"
      end
    end

    assert_equal_html expected_output, output
  end

  test "custom void (self-closing) element" do
    expected_output = <<~HTML
      <async-image src="assets/bird.jpg">
    HTML

    output = html do
      void "async-image", src: "assets/bird.jpg"
    end

    assert_equal_html expected_output, output
  end
end
