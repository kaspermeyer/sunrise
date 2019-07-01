require "test_helper"

class Week2Test < Sunrise::TestCase
  include Sunrise::Helper

  test "multiple elements per block-level" do
    expected_output = <<~HTML
      <ul>
        <li>One</li>
        <li>Two</li>
        <li>Three</li>
      </ul>
      <button>Add new item</button>
    HTML

    output = html do
      ul do
        li { text "One" }
        li { text "Two" }
        li { text "Three" }
      end
      button { text "Add new item" }
    end

    assert_equal squish_html_string(expected_output), output
  end
end
