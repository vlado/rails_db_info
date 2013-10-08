require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  # fixtures :all

  test "I see list of tables when I visit rails_dba dashboard" do
    get '/rails_dba'

    assert assigns(:tables)
    assert_select 'h2', 'Tables'
    %w(schema_migrations users).each do |table|
      assert_select 'table.tables tr td', table
    end
  end

  test 'I see table column details when I visit table page' do
    get '/rails_dba/tables/users'

    assert assigns(:table)
    assert_select 'h2', "Schema for 'users' table"
    User.columns.each do |col|
      assert_select "table tr td.name", col.name
      assert_select "table tr td.sql_type", col.sql_type
    end
  end

  test 'I see table title, column names and values when I visit show table entries page' do
    User.create([
      { :username => 'vlado', :email => 'vlado@cingel.hr', :age => 33, :admin => true },
      { :username => 'ana', :email => 'ana@cingel.hr', :age => 34, :admin => false }
    ])

    get '/rails_dba/tables/users/entries'

    assert assigns(:table)
    assert_select 'h2', "Entries in 'users' table"
    User.column_names.each do |col|
      assert_select 'table thead tr:first-child th', col
    end
    assert_equal 2, css_select('table tbody tr').size
    assert_select 'table tbody tr:first-child td.username', 'vlado'
    assert_select 'table tbody tr:last-child td.username', 'ana'
  end

  test 'I can paginate through entires' do
    25.times do |i|
      User.create(:username => "vlado#{i+1}", :email => "vlado#{i+1}@cingel.hr", :age => 33, :admin => true)
    end

    get '/rails_dba/tables/users/entries'
    assert_equal 10, css_select('table tbody tr').size
    assert_select 'table tbody tr:first-child td.username', 'vlado1'
    assert_select 'table tbody tr:last-child td.username', 'vlado10'

    get '/rails_dba/tables/users/entries?page=1'
    assert_equal 10, css_select('table tbody tr').size
    assert_select 'table tbody tr:first-child td.username', 'vlado1'
    assert_select 'table tbody tr:last-child td.username', 'vlado10'

    get '/rails_dba/tables/users/entries?page=2'
    assert_equal 10, css_select('table tbody tr').size
    assert_select 'table tbody tr:first-child td.username', 'vlado11'
    assert_select 'table tbody tr:last-child td.username', 'vlado20'

    get '/rails_dba/tables/users/entries?page=3'
    assert_equal 5, css_select('table tbody tr').size
    assert_select 'table tbody tr:first-child td.username', 'vlado21'
    assert_select 'table tbody tr:last-child td.username', 'vlado25'
  end
end

