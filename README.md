# Administrator and API for [PREP application](https://github.com/resource-watch/prep-app)

[![Build Status](https://travis-ci.org/resource-watch/prep-api.svg?branch=master)](https://travis-ci.org/resource-watch/prep-api)
[![Test Coverage](https://api.codeclimate.com/v1/badges/59331ed7504c0e00db4c/test_coverage)](https://codeclimate.com/github/resource-watch/prep-api/test_coverage)

![PREP](screenshot.png?raw=true "The Climate Partnership for Resilience and Preparedness")


## Install

Requirements:

* NodeJS
* Ruby 2.4.1
* Yarn

The app rides on [Ruby on Rails](http://rubyonrails.org).

Clone repo:

```bash
$ git clone https://github.com/resource-watch/prep-manager
$ cd prep-manager
```

We recommend managing your Ruby installation through
[rbenv](https://github.com/sstephenson/rbenv). It's just an easy way to
run multiple Ruby versions for different applications:

```bash
$ rbenv install 2.4.1
$ rbenv local 2.4.1
```

Install gem dependencies using [Bundler](http://bundler.io/)

```bash
$ bundle install
```

Set up database:

```bash
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## Usage

Duplicate `.env.sample`, rename to `.env` and finally set your options in that file.

After install it, we can run server runing:

```bash
bundle exec rails server
```


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request :D


## LICENSE

[MIT](LICENSE)
