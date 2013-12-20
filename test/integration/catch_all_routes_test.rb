require 'test_helper'

class CatchAllRoutesTest < ActionDispatch::IntegrationTest
  setup do
    ENV['CATCH_ALL_ROUTE'] = 'catch'
    Rails.application.reload_routes!
  end

  teardown do
    ENV.delete('CATCH_ALL_ROUTE')
    Rails.application.reload_routes!
  end

  test "I see list of tables when I visit rails_db_info dashboard" do
    get '/rails/info/db'

    assert assigns(:tables)
    assert_select 'h1', 'Tables'
    %w(schema_migrations users).each do |table|
      assert_select 'table.tables tr td', table
    end
  end

  test 'I see table column details when I visit table page' do
    get '/rails/info/db/tables/users'

    assert assigns(:table)
    assert_select 'h1', /users/
    User.columns.each do |col|
      assert_select "table tr td.name", col.name
      assert_select "table tr td.sql_type", col.sql_type
    end
  end
end
