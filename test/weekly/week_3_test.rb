require "test_helper"

class Week3est < Sunrise::TestCase
  include Sunrise::Helper

  test "multiple root level elements" do
    expected_output = <<~HTML
      <div>
        <span>I'm a child!</span>
      </div>
      <div>
      </div>
    HTML

    output = html do
      div do
        span "I'm a child!"
      end
      div
    end

    assert_equal_html expected_output, output
  end

  test "siblings" do
    expected_output = <<~HTML
      <div class="modal">
        <button class="btn btn-default">Close</button>
        <button class="btn btn-primary">Save</button>
      </div>
    HTML

    output = html do
      div class: "modal" do
        button "Close", class: "btn btn-default"
        button "Save", class: "btn btn-primary"
      end
    end

    assert_equal_html expected_output, output
  end
end
