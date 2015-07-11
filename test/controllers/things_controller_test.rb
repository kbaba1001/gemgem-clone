require 'test_helper'

class ThingsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    visit new_thing_path

    assert { page.has_selector?('.thing__new-form') == true }

    # assert_select "form #thing_name"
    # assert_select "form #thing_name.readonly", false
  end
end
