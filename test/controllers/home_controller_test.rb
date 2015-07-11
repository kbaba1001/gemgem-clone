require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get root_path

    assert_select '.title', {text: /Welcome/}
    assert_select 'a', {text: 'new thing'}
  end
end
