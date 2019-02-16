require "application_system_test_case"

class GetTfxDataTest < ApplicationSystemTestCase

  test "visiting truefx.com" do
    Capybara.run_server = false
    Capybara.app_host   = 'https://truefx.com'
    sleep 0
    visit '/?page=how'
    sleep 0
    visit '/?page=partners'
    sleep 0
    visit '/?page=about'
    sleep 0
    visit '/?page=faqs'
    sleep 0
    visit '/?page=contact'
    sleep 0
    visit '/?page=privacy'
    sleep 0
    visit '/?page=logina'
    p ENV['TRUEFX_USER']
    p ENV['TRUEFX_PASS']
    sleep 0
    login_elm = find("#login-form")
    user_inp  = login_elm.find('input[name="USERNAME"]')
    pass_inp  = login_elm.find('input[name="PASSWORD"]')
    user_inp.fill_in with: ENV['TRUEFX_USER']
    sleep 1
    pass_inp.fill_in with: ENV['TRUEFX_PASS']
    b_elm = find('input[value="Login"]')
    sleep 1
    b_elm.click
    sleep 4
    visit '/?page=downloads'
    sleep 4
    assert true
    
  end
end
