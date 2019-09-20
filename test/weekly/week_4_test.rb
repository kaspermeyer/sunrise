# frozen_string_literal: true

require "test_helper"

class Week4Test < Sunrise::TestCase
  include Sunrise::Helper

  test "void elements" do
    expected_output = <<~HTML
      <input type="submit" value="Save">
      <img src="smiley.gif" alt="Smiley face">
    HTML

    output = html do
      input type: "submit", value: "Save"
      img src: "smiley.gif", alt: "Smiley face"
    end

    assert_equal_html expected_output, output
  end

  test "ignoring inline content" do
    expected_output = <<~HTML
      <input type="submit" value="Save">
    HTML

    output = html do
      input "I won't get rendered", type: "submit", value: "Save"
    end

    assert_equal_html expected_output, output
  end

  test "ignoring block-level content" do
    expected_output = <<~HTML
      <input type="submit" value="Save">
    HTML

    output = html do
      input type: "submit", value: "Save" do
        text "I won't get rendered"
      end
    end

    assert_equal_html expected_output, output
  end
end
