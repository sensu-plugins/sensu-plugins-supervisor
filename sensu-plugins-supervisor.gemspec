lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'

require_relative 'lib/sensu-plugins-supervisor'

Gem::Specification.new do |s|
  s.authors                = ['Sensu-Plugins and contributors']

  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides native supervisord instrumentation
                              for monitoring service status'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  # ./ext/mkrf_conf.rb is not a normal c extension file, its a hack but a neccessary one
  # due to xmlrpc only being a gem that can be installed on ruby 2.3 or later and prior
  # to 2.4 it was part of stdlib
  s.extensions             = Dir.glob('ext/**/*.rb')
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  s.homepage               = 'https://github.com/sensu-plugins/sensu-plugins-supervisor'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => 'sensu-plugin',
                               'production_status'  => 'unstable - testing recommended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-supervisor'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.1'

  s.summary                = 'Sensu plugins for working with supervisor'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsSupervisor::Version::VER_STRING

  s.add_runtime_dependency 'ox', '~> 2.5.0'
  s.add_runtime_dependency 'ruby-supervisor', '0.0.2'
  s.add_runtime_dependency 'sensu-plugin', '~> 1.2'
  # when we drop ruby < 2.4 support we can add this and remove
  # the extension to conditionally deal with breaking changes
  # across ruby versions and uncomment the following:
  # s.add_runtime_dependency 'xmlrpc', '~> 0.3'

  s.add_development_dependency 'bundler',                   '~> 1.7'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  s.add_development_dependency 'github-markup',             '~> 3.0'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 12.3'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rubocop',                   '~> 0.57.2'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
