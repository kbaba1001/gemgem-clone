require 'test_helper'

class ThingsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    visit new_thing_path

    assert { page.has_selector?('.thing__new-form') == true }

    # assert_select "form #thing_name"
    # assert_select "form #thing_name.readonly", false
  end

  sub_test_case '#create' do
    test 'success' do
      post things_path, {thing: {name: 'Bad Religion'}}

      assert_redirected_to thing_path(Thing.last)
    end

    test 'error' do
      post things_path, {thing: {name: ''}}

      assert { path == '/things' }
      assert_select '.error'
    end
  end
end
