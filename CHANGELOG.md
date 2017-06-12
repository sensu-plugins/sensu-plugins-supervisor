#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
## [1.1.0] 2017-06-12
### Added
- support for ruby 2.4: issues caused by `libxmlrpc` being removed from ruby 2.4. Basically we need to solve this by checking the version of ruby at **install time** where dependencies in `.gemspec` are specified at **build time**. This requires using a ruby extension. I included comments in several places to make this more obvious to users that might be confused by this behavior. I also included some Dockerfiles for ruby 2.2-2.4 so that we can test this out better.

## [1.0.3] 2017-06-07
### Fixed
- check-supervisor-socket.rb: Switched to ox for xmlrpc parser, fixes #19.

## [1.0.2] 2017-06-01
- sensu-plugins-supervisor.gemspec: update Gemspec and README as per issue https://github.com/sensu-plugins/sensu-plugins-supervisor/issues/15

## [1.0.1] 2017-06-01
### Fixed
- check-supervisor-socket.rb: update XMLRPC::XMLParser::XMLStreamParser to XMLRPC::XMLParser::LibXMLStreamParser as per issue https://github.com/sensu-plugins/sensu-plugins-supervisor/issues/16

## [1.0.0] - 2016-11-07
### Added
- Support for Ruby 2.3.0

### Removed
- Support for Ruby 1.9.3 & Ruby 2.0.0

### Changed
- Bump mininum ruby version to 2.1

### Fixed
- check-supervisor.rb: Fixed wrong variable assignment, this fixes authentication failures when running check.
- check-supervisor.rb: Updated port short variable name to avoid collision with password variable (-p -> -P).

## [0.0.4] - 2016-08-17
### Changed
- Updated sensu-plugin dependency from `= 1.2.0` to `~> 1.2.0`
- Now using built-in xmlrpc parser, removes dependecy on libxml-xmlrpc
- Failure connecting to supervisor now provides additional exception context

### Added
- check-supervisor.rb: added support for username and password via http
- check-supervisor.rb: added support for reporting multiple failed services per run

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-03
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-29
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/1.1.0...HEAD
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/1.0.3...1.1.0
[1.0.3]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-supervisor/compare/0.0.1...0.0.2
