require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "I see list of tables when I visit rails_dba dashboard" do
    get '/rails_dba'

    assert assigns(:tables)
    assert_select 'h2', 'Tables'
    assert_select 'ul.tables li', 'users'
  end

  test 'I see table title, column names and values when I visit show table page' do

  end
end

