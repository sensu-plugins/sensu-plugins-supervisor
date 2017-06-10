## Sensu-Plugins-supervisor

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-supervisor.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-supervisor)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-supervisor.svg)](http://badge.fury.io/rb/sensu-plugins-supervisor)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-supervisor/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-supervisor)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-supervisor/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-supervisor)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-supervisor.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-supervisor)

## Functionality

## Files
 * bin/check-supervisor.rb
 * bin/check-supervisor-socket.rb

## Usage

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

### Some extra info on a hack regarding xmlrpc
So in ruby 2.4 they removed `xmlrpc` from stdlib and made it a ruby gem. As this gem is only installable on 2.3 (according to doc but most users report being unable to install in 2.3) this creates problems. On the surface you might think that we could do something like this in the `.gemspec`:

```ruby
if RUBY_VERSION >= "2.4"
  installer.install "xmlrpc", "~> 0.3"
end
```

However this is not something we need evaluated at build time but actually at install time. Ruby does not have a great way of doing this but we can accomplish this by using a c extension to force this behavior at run time. This was based off: http://www.programmersparadox.com/2012/05/21/gemspec-loading-dependent-gems-based-on-the-users-system/

### Testing this behavior
I have included 2 dockerfiles to test installing on ruby 2.3 and ruby 2.4.

#### Building
Ruby 2.2:
```
$ docker build -f Dockerfile-ruby2.2 .
Sending build context to Docker daemon  221.2kB
Step 1/6 : FROM ruby:2.2-slim
2.2-slim: Pulling from library/ruby
10a267c67f42: Already exists
0aaa89427703: Already exists
4e4351445696: Already exists
72c399ee88ad: Pull complete
cd4fc9895ed7: Pull complete
00facae99acf: Pull complete
Digest: sha256:9f39e5306ac98b6ff46a7f5247ace88b4e3723a3fe04dcfa317cabed07dadd8f
Status: Downloaded newer image for ruby:2.2-slim
 ---> 81e5c2fd16a9
Step 2/6 : RUN mkdir /usr/src/app
 ---> Running in f92de1d4ae5a
 ---> 7e0786e64a4a
Removing intermediate container f92de1d4ae5a
Step 3/6 : ADD . /usr/src/app
 ---> 9d2cb5c24d80
Removing intermediate container e52c9e26d2cc
Step 4/6 : WORKDIR /usr/src/app
 ---> 94d1e262851f
Removing intermediate container 427d79912bd9
Step 5/6 : RUN apt-get update   && apt-get install -y build-essential
 ---> Running in 62819ad68ade
<INTENTIONALLY_REMOVED_OUTPUT_FROM_APT>
 ---> 4ee671ec2163
Removing intermediate container 62819ad68ade
Step 6/6 : CMD ./docker-test
 ---> Running in 25d0d0e45692
 ---> d0339d43c554
Removing intermediate container 25d0d0e45692
Successfully built d0339d43c554
```

Ruby 2.3:
```
$ docker build -f Dockerfile-ruby2.3 .
Sending build context to Docker daemon  179.7kB
Step 1/6 : FROM ruby:2.3-slim
 ---> 684863def0d3
Step 2/6 : RUN mkdir /usr/src/app
 ---> Using cache
 ---> e62979ea3e34
Step 3/6 : ADD . /usr/src/app
 ---> 7bbdf2f16ff5
Removing intermediate container bdaf432e06fe
Step 4/6 : WORKDIR /usr/src/app
 ---> b9b014ac62a2
Removing intermediate container 0f9ebd7711ff
Step 5/6 : RUN apt-get update   && apt-get install -y build-essential
 ---> Running in 06d6ce00c56d
<INTENTIONALLY_REMOVED_OUTPUT_FROM_APT>
 ---> 30e212e3dc48
Removing intermediate container 06d6ce00c56d
Step 6/6 : CMD ./docker-test
 ---> Running in a1205ff9acce
 ---> e9e3c5affbc0
Removing intermediate container a1205ff9acce
Successfully built e9e3c5affbc0
```

Ruby 2.4:
```
$ docker build -f Dockerfile-ruby2.4 .
Sending build context to Docker daemon  178.2kB
Step 1/6 : FROM ruby:2.4-slim
 ---> 6dd077757d49
Step 2/6 : RUN mkdir /usr/src/app
 ---> Using cache
 ---> 4f45395487f3
Step 3/6 : ADD . /usr/src/app
 ---> fd2af990b369
Removing intermediate container 6b5e7cc4a515
Step 4/6 : WORKDIR /usr/src/app
 ---> f2019fc2ae01
Removing intermediate container d471aea79711
Step 5/6 : RUN apt-get update   && apt-get install -y build-essential
 ---> Running in 3f9106d17a3d
<INTENTIONALLY_REMOVED_OUTPUT_FROM_APT>
 ---> ae1a635f5731
Removing intermediate container 3f9106d17a3d
Step 6/6 : CMD ./docker-test
 ---> Running in ccc8b4be1d08
 ---> 6d927a3f6fd1
Removing intermediate container ccc8b4be1d08
Successfully built 6d927a3f6fd1
```

#### Validation
Ruby 2.2:
```
$ docker run d0339d43c554
WARNING:  pessimistic dependency on ox (~> 2.5.0) may be overly strict
  if ox is semantically versioned, use:
    add_runtime_dependency 'ox', '~> 2.5', '>= 2.5.0'
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
  Successfully built RubyGem
  Name: sensu-plugins-supervisor
  Version: 1.1.0
  File: sensu-plugins-supervisor-1.1.0.gem
Successfully installed mixlib-cli-1.7.0
Successfully installed sensu-plugin-1.4.5
Successfully installed ruby-supervisor-0.0.2
Building native extensions.  This could take a while...
Successfully installed ox-2.5.0
Building native extensions.  This could take a while...
You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu
Successfully installed sensu-plugins-supervisor-1.1.0
5 gems installed
```

Ruby 2.3:
```
$ docker run e9e3c5affbc0
WARNING:  pessimistic dependency on ox (~> 2.5.0) may be overly strict
  if ox is semantically versioned, use:
    add_runtime_dependency 'ox', '~> 2.5', '>= 2.5.0'
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
  Successfully built RubyGem
  Name: sensu-plugins-supervisor
  Version: 1.1.0
  File: sensu-plugins-supervisor-1.1.0.gem
Successfully installed mixlib-cli-1.7.0
Successfully installed sensu-plugin-1.4.5
Successfully installed ruby-supervisor-0.0.2
Building native extensions.  This could take a while...
Successfully installed ox-2.5.0
Building native extensions.  This could take a while...
You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu
Successfully installed sensu-plugins-supervisor-1.1.0
5 gems installed
```

Ruby 2.4:
```
$ docker run 6d927a3f6fd1
WARNING:  pessimistic dependency on ox (~> 2.5.0) may be overly strict
  if ox is semantically versioned, use:
    add_runtime_dependency 'ox', '~> 2.5', '>= 2.5.0'
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
  Successfully built RubyGem
  Name: sensu-plugins-supervisor
  Version: 1.1.0
  File: sensu-plugins-supervisor-1.1.0.gem
Building native extensions.  This could take a while...
Successfully installed json-1.8.6
Successfully installed mixlib-cli-1.7.0
Successfully installed sensu-plugin-1.4.5
Successfully installed ruby-supervisor-0.0.2
Building native extensions.  This could take a while...
Successfully installed ox-2.5.0
Building native extensions.  This could take a while...
You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu
Successfully installed sensu-plugins-supervisor-1.1.0
6 gems installed
```

## Notes
