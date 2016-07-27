# Administrator and API for [PREP application](https://github.com/resource-watch/prep-app)

![Prep home](screenshot.png?raw=true "Preparednes forresilience")


## Install

The app rides on [Ruby on Rails](http://rubyonrails.org) and [React](https://facebook.github.io/react/) both working together.

Clone repo:

```bash
$ git clone https://github.com/resource-watch/preparedness-for-resilience
$ cd preparedness-for-resilience
```

We recommend managing your Ruby installation through
[rbenv](https://github.com/sstephenson/rbenv). It's just an easy way to
run multiple Ruby versions for different applications:

```bash
$ rbenv install 2.3.1
$ rbenv local 2.3.1
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

### Rendering & mounting

`react-rails` includes a view helper (`react_component`) and an unobtrusive JavaScript driver (`react_ujs`) which work together to put React components on the page. [More info](https://github.com/reactjs/react-rails#rendering--mounting).

```erb
<%= react_component('HelloMessage', name: 'John') %>
```


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request :D


## LICENSE

[MIT](LICENSE)
