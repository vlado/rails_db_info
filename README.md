# Rails database info [![Build Status](https://travis-ci.org/vlado/rails_db_info.png)](https://travis-ci.org/vlado/rails_db_info)

Show database info in your Rails app by visiting `http://localhost:3000/rails/db/info`

## Install

Add this to the development group in your Gemfile

```ruby
group :development do
  gem 'rails_db_info'
end
```

Run `bundle install`

Visit `http://localhost:3000/rails/db/info` and you will see your database schema and values.

## Why?

I was using [Annotate](https://github.com/ctran/annotate_models) to annotate my models with schema info. When I saw [Sextant](https://github.com/schneems/sextant) I got an idea to create something similar for database and the rest is history :)

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

This project rocks and uses MIT-LICENSE.
