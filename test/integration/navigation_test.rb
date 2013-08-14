require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "I see list of tables when I visit rails_dba dashboard" do
    get '/rails_dba'

    assert assigns(:tables)
    assert_select 'h2', 'Tables'
  end
end

