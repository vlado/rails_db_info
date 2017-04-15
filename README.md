# Rails database info [![Build Status](https://travis-ci.org/vlado/rails_db_info.png)](https://travis-ci.org/vlado/rails_db_info) [![Code Climate](https://codeclimate.com/github/vlado/rails_db_info.png)](https://codeclimate.com/github/vlado/rails_db_info) [![Gem Version](https://badge.fury.io/rb/rails_db_info.png)](http://badge.fury.io/rb/rails_db_info)

Adds an html endpoint to your Rails application which will give you a quick display of your database schema and contents for reference at `http://localhost:3000/rails/info/db`

**Demo** available at [http://rails-db-info-demo.herokuapp.com](http://rails-db-info-demo.herokuapp.com)

![Schema](https://raw.github.com/vlado/rails_db_info/screenshots/screenshots/schema.png)

![Entries](https://raw.github.com/vlado/rails_db_info/screenshots/screenshots/entries.png)

## Install

Add this to the development group in your Gemfile

```ruby
group :development do
  gem 'rails_db_info'
end
```

Run `bundle install`

Modify routes.rb

```ruby
  mount RailsDbInfo::Engine => "/rails/info/db"
```

Visit `http://localhost:3000/rails/info/db` and you will see your database schema and values.

### For users of catch-all routes

If (and only if) you have catch all routes like `get '*path' => 'your_controller#your_action'` in your app already, you can manually add rails_db_info to your routes (config/routes.rb) **before** the catch-all routes like this.

```ruby
if Rails.env.development?
  mount_rails_db_info as: 'rails_db_info_engine'
  # mount_rails_db_info is enough for rails version < 4
end
get '*path' => 'your_controller#your_action'
```

## Why?

I was using [Annotate](https://github.com/ctran/annotate_models) to annotate my models with schema info. When I saw [Sextant](https://github.com/schneems/sextant) I got an idea to create something similar for database and the rest is history :)

## Todo / Ideas

- [ ] Improve CSS
- [ ] Add small bar (like miniprofiler has) at top of the page or add key listener(s). When triggered it would show database info. For example you are working on UsersController and when you press Cmd+D users table info slides down.
- [ ] Generator to copy assets in case asset pipeline is disabled

Contributions welcome :)

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Running tests

```
$ RAILS_ENV=test bundle exec rake db:migrate
$ bundle exec rake
```

To run tests for specific rails version use custom Gemfile from [gemfiles](https://github.com/vlado/rails_db_info/tree/master/gemfiles) folder

```
$ BUNDLE_GEMFILE=gemfiles/rails_3-2-stable.gemfile bundle install
$ BUNDLE_GEMFILE=gemfiles/rails_3-2-stable.gemfile bundle exec rake
```

## License

This project rocks and uses MIT-LICENSE.
