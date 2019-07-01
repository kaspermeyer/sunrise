require "test_helper"

class Week1Test < Sunrise::TestCase
  include Sunrise::Helper

  test "empty element" do
    expected_output = <<~HTML
      <div></div>
    HTML

    output = html do
      div
    end

    assert_equal_html expected_output, output
  end

  test "element with text content" do
    expected_output = <<~HTML
      <div>Cool text</div>
    HTML

    output = html do
      div do
        text 'Cool text'
      end
    end

    assert_equal_html expected_output, output
  end

  test "element with attributes" do
    expected_output = <<~HTML
      <a href="http://google.com" class="underline bold">
        Cool link!
      </a>
    HTML

    output = html do
      a href: 'http://google.com', class: 'underline bold' do
        text 'Cool link!'
      end
    end

    assert_equal_html expected_output, output
  end

  test "nested elements" do
    expected_output = <<~HTML
      <div>
        <span>
          <a href="http://google.com">
            A link to google
          </a>
        </span>
      </div>
    HTML

    output = html do
      div do
        span do
          a href: 'http://google.com' do
            text 'A link to google'
          end
        end
      end
    end

    assert_equal_html expected_output, output
  end
end
