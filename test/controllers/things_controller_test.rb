require 'test_helper'

class ThingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thing = Thing::Create[thing: {name: "Rails"}].model
  end

  test '#new' do
    get new_thing_path

    assert_select '.thing__form'
    assert_select '.thing__form--name.readonly', false
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
    get thing_path(@thing.id)

    assert_select '.thing__display-name', {text: /Rails/}
  end

  test '#edit' do
    get edit_thing_path(@thing.id)

    assert_select '.thing__form--name' do
      assert_select '.readonly'
      assert_select '[value=?]', 'Rails'
    end
  end
end
