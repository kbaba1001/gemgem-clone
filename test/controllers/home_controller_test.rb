require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    visit root_path

    within('.title') do
      assert { /Welcome/ === text }
    end

    assert { page.has_selector?('a', 'new thing') == true }
  end
end
