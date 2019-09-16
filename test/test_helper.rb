# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sunrise"
require "minitest/autorun"
require "minitest/reporters"
require "support/test_case"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Converts multi-line HTML-string with arbitrary indentation to a squished one-line version
def squish_html_string html_string
  # Delete newlines and occurences of two or more whitespaces
  html_string.to_s.delete("\n").gsub(/[ ]{2,}/, "")
end

def assert_equal_html expected, actual
  assert_equal squish_html_string(expected), squish_html_string(actual)
end
