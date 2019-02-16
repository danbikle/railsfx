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

    years_a    = [2010] #,2011,2012,2013,2014,2015,2016,2017,2018]
    months_s_a = ['JANUARY'] #,'FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER']
    pairs_a    = ['AUDUSD'] #,'EURUSD','GBPUSD','USDCAD','USDJPY']
    for yr_i       in years_a    do
      for month_s  in months_s_a do
        for pair_s in pairs_a    do
          click_link('Downloads')
          sleep 2
          click_link(String(yr_i))
          sleep 2
          click_link(month_s.capitalize)
          sleep 2
          click_link(pair_s)
          sleep 4
        end
      end
    end
    
    assert true
    
  end
end
