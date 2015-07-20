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

    assert_select '.thing-panel__header', 'Trailblazer'
    assert_select '.thing-panel__header', 'Descendents'

    # assert_select ".columns .header a", "Descendents" # TODO: test not-end.
    # assert_select ".columns.end .header a", "Trailblazer"
  end
end
