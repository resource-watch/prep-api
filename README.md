# Preparednes-for-resilience

![Prep home](screenshot.png?raw=true "Preparednes forresilience")

The app rides on [Ruby on Rails](http://rubyonrails.org) and [React](https://facebook.github.io/react/) both working together by [Vizzuality rails-redux-scaffolding](https://github.com/Vizzuality/rails-redux-scaffold)

## Developing

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

Installing front end dependencies:

```bash
$ npm install
```

Set up database:

```bash
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

# How to use

Duplicate `.env.sample`, rename to `.env` and finally set your options in that file.

After install it, we can run server runing:

```bash
bundle exec rails server
```

## Rendering & mounting

`react-rails` includes a view helper (`react_component`) and an unobtrusive JavaScript driver (`react_ujs`) which work together to put React components on the page. [More info](https://github.com/reactjs/react-rails#rendering--mounting).

```erb
<%= react_component('HelloMessage', name: 'John') %>
```

# License

The MIT License (MIT)

Copyright (c) 2015 Vizzuality

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
