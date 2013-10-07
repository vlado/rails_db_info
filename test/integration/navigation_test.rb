require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  # fixtures :all

  test "I see list of tables when I visit rails_dba dashboard" do
    get '/rails_dba'

    assert assigns(:tables)
    assert_select 'h2', 'Tables'
    %w(schema_migrations users).each do |table|
      assert_select 'ul.tables li', table
    end
  end

  test 'I see table title, column names and values when I visit show table page' do
    User.create([
      { :username => 'vlado', :email => 'vlado@cingel.hr', :age => 33, :admin => true },
      { :username => 'ana', :email => 'ana@cingel.hr', :age => 34, :admin => false }
    ])

    get '/rails_dba/tables/users'

    assert assigns(:table)
    assert_select 'h2', 'users'
    User.column_names.each do |col|
      assert_select 'table thead tr:first-child th', col
    end
    assert css_select('table tbody tr').size, 2
    assert_select 'table tbody tr:first-child td.username', 'vlado'
    assert_select 'table tbody tr:last-child td.username', 'ana'
  end
end

