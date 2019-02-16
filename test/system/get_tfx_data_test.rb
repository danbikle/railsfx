require "application_system_test_case"

class GetTfxDataTest < ApplicationSystemTestCase

  test "visiting truefx.com" do
    Capybara.run_server = false
    Capybara.app_host   = 'https://truefx.com'
    sleep 2
    visit '/?page=how'
    sleep 2
    visit '/?page=downloads'
    sleep 2
    visit '/?page=partners'
    sleep 2
    visit '/?page=about'
    sleep 2
    visit '/?page=faqs'
    sleep 2
    visit '/?page=contact'
    sleep 2
    visit '/?page=privacy'
    sleep 2
    visit '/?page=logina'
    p ENV['TRUEFX_USER']
    p ENV['TRUEFX_PASS']
    sleep 2
    user_elm = find("")
    assert true
    
  end
end
