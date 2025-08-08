require "application_system_test_case"

class DemoTest < ApplicationSystemTestCase
  test "visiting the basic demo" do
    visit basic_demo_url

    assert_inlined_style "demo_component"
    assert_linked_style "demo2_component"
    assert_inlined_style "demo3_component"

    assert_backgrounds ".global_style", 1, "green"
    assert_backgrounds ".demo_component", 1, "red"
    assert_backgrounds ".demo2_component", 1, "yellow"
    assert_backgrounds ".demo3_component", 1, "blue"
  end

  test "visiting the import demo" do
    visit import_demo_url

    assert_inlined_style "demo_import_component"
    assert_linked_style "demo_import2_component"

    assert_backgrounds ".demo_import_component", 1, "purple"
    assert_backgrounds ".demo_import2_component", 1, "yellow"
  end
end
