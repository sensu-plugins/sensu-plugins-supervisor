## Sensu-Plugins-supervisor

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-supervisor.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-supervisor)
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

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-supervisor -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-supervisor`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-supervisor' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-supervisor' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
