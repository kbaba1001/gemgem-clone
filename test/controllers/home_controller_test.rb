require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    # 本当は Database Cleaner などを使うほうが良さそう
    Thing.delete_all

    Thing::Create[thing: {name: "Trailblazer"}]
    Thing::Create[thing: {name: "Descendents"}]

    get root_path

    assert_select '.title', {text: /Welcome/}
    assert_select 'a', {text: 'new thing'}

    assert_select '.columns .thing-panel__header a', 'Descendents'
    assert_select '.columns.end .thing-panel__header', 'Trailblazer'
  end
end
