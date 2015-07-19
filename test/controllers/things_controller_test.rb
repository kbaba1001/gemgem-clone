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

  sub_test_case '#update' do
    test 'success' do
      # name は writeable: false だがこれは View の form と paramater で更新できなくしているだけで、
      # 直接リクエストを投げられると更新できる。
      # name の値を更新しようとしたら Validation Error にする方が丁寧だと思う。
      put thing_path(@thing), id: @thing.id, thing: {name: 'Trb'}

      assert_redirected_to thing_path(@thing)
    end

    test 'error' do
      # description is too short (minimum is 4 characters)
      put thing_path(@thing), id: @thing.id, thing: {description: 'bla'}

      assert_select '.error'
    end
  end
end
