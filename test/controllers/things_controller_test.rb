require 'test_helper'

class ThingsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    get new_thing_path

    assert_select '.thing__new-form'
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

  test '#show' do
    thing = Thing::Create[thing: {name: "Rails"}].model

    get thing_path(thing.id)

    assert_select '.thing__display-name', {text: /Rails/}
  end
end
