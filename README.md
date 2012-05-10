DbFu: an easy ruby only ActiveRecord setup
============================================

What started as a way to use Postgres in pure ruby for [Ruby Off Rails](http://rubyoffrails.com) became
useful in Wordpress and other databases where I wanted to use Ruby.

Usage
----

1. Clone and bundle
2. copy config/database.yml.sample to config/database.yml and configure
3. Add your ActiveRecord classes to ```models/wp_post.rb```

Example
-------

Gather your published wordpress posts:

```
class WpPost < ActiveRecord::Base
  scope :published, lambda { where(post_status: "publish")}
end

WpPost.published.order("post_date desc").limit(10)
```

LICENSE
-------

Copyright Jesse Wolgamott 2012. MIT License (see LICENSE)
