# frozen_string_literal: true

require "test_helper"

class Week2Test < Sunrise::TestCase
  include Sunrise::Helper

  test "inline content" do
    expected_output = <<~HTML
      <button class="btn btn-primary">Press me!</button>
    HTML

    output = html do
      button "Press me!", class: "btn btn-primary"
    end

    assert_equal_html expected_output, output
  end

  test "inline content takes precedence over block content" do
    expected_output = <<~HTML
      <button class="btn btn-primary">Press me!</button>
    HTML

    output = html do
      button "Press me!", class: "btn btn-primary" do
        text "I (hopefully) won't get rendered"
      end
    end

    assert_equal_html expected_output, output
  end

  test "element without inline content or block content" do
    expected_output = <<~HTML
      <button class="btn btn-primary"></button>
    HTML

    output = html do
      button class: "btn btn-primary"
    end

    assert_equal_html expected_output, output
  end

  test "text content with a block" do
    expected_output = <<~HTML
      <button class="btn btn-primary">Press me!</button>
    HTML

    output = html do
      button class: "btn btn-primary" do
        text { "Press me!" }
      end
    end

    assert_equal_html expected_output, output
  end
end
