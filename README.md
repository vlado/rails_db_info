# Rails database info [![Build Status](https://travis-ci.org/vlado/rails_db_info.png)](https://travis-ci.org/vlado/rails_db_info) [![Code Climate](https://codeclimate.com/github/vlado/rails_db_info.png)](https://codeclimate.com/github/vlado/rails_db_info)

Show database info in your Rails app by visiting `http://localhost:3000/rails/info/db`

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

Visit `http://localhost:3000/rails/info/db` and you will see your database schema and values.

## Why?

I was using [Annotate](https://github.com/ctran/annotate_models) to annotate my models with schema info. When I saw [Sextant](https://github.com/schneems/sextant) I got an idea to create something similar for database and the rest is history :)

## Todo / Ideas

- [ ] Improve CSS
- [ ] Add small bar (like miniprofiler has) at top of the page or add key listener(s). When triggered it would show database info. For example you are working on UsersController and when you press Cmd+D you users table info slides down.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Running tests

Make sure you have test database prepared `cd test/dummy; rake db:test:prepare`

```
$ rake
```

## License

This project rocks and uses MIT-LICENSE.
