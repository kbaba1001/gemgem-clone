require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    visit '/'

    within('.title') do
      assert { /Welcome/ === text }
    end

    assert { has_link?('new thing') == true }
  end
end
