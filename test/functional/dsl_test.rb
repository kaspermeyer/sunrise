require "test_helper"

class DslTest < Sunrise::TestCase
  include Sunrise::Helper

  test "basic markup" do
    output = html do
      div
    end

    assert_equal '<div></div>', output
  end

  test "element with text content" do
    output = html do
      div do
        text 'Cool text'
      end
    end

    assert_equal '<div>Cool text</div>', output
  end

  test "attributes" do
    output = html do
      a href: 'http://google.com', class: 'underline bold' do
        text 'Cool link!'
      end
    end

    assert_equal '<a href="http://google.com" class="underline bold">Cool link!</a>', output
  end

  test "nested elements" do
    output = html do
      div do
        span do
          a href: 'http://google.com' do
            text 'a link to google'
          end
        end
      end
    end

    assert_equal '<div><span><a href="http://google.com">a link to google</a></span></div>', output
  end
end
