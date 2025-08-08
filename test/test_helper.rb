ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def assert_backgrounds(selector, count, value)
      names = {
        "rgb(255, 0, 0)" => "red",
        "rgb(255, 255, 0)" => "yellow",
        "rgb(0, 128, 0)" => "green",
        "rgb(0, 0, 255)" => "blue"
      }

      backgrounds = evaluate_script <<~SCRIPT
        (() => {
          const els = document.querySelectorAll("#{selector}")
          return Array.from(els).map(el => getComputedStyle(el).getPropertyValue('background-color'));
        })();
      SCRIPT

      assert_selector selector, { count: }
      assert_equal(1, backgrounds.uniq.length)
      assert_equal(names[backgrounds[0]], value)
    end
  end
end
