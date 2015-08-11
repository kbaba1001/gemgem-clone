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

    assert_select 'input.button[value=?]', 'Create Comment'
    assert_select '.comment_user_email'
    assert_select '.comments .comment'
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
      # name は writeable: false だがこれは View の form と paramater で更新できなくしているだけなので、
      # name パラメータをつけてリクエストを投げると単純に無視する。
      # gemgem-trbrb がこのようなテストになっているのでそのままにしているが、テストの意図を考えると、
      # `put thing_path(@thing), id: @thing.id, thing: {description: 'hogefuga'}` のようにした方が良いと思う。
      # また、 redirect した後のページで更新された値を確認するテストを追加しても良いが、
      # これは controller test ではなく feature test に相当するためここではテストできない...
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
