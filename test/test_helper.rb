$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sunrise"
require "minitest/autorun"
require "minitest/reporters"
require "support/test_case"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
