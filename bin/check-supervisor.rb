#!/usr/bin/env ruby
#
# check-supervisor-socket
#
#
# DESCRIPTION:
#   Check all supervisor processes are running#
#
# OUTPUT:
#   Plain text, 'All processes running' or eg. 'redis-server not running: FATAL'
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: ruby-supervisor
#
# USAGE:
#   check-supervisor-socket.rb
#
# LICENSE:
#    Copyright (c) 2013 Double Negative Limited and Johan van den Dorpe
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.

require 'sensu-plugin/check/cli'
require 'ruby-supervisor'
require 'set'

class CheckSupervisor < Sensu::Plugin::Check::CLI
  option :host,
         description: 'Hostname to check',
         short:       '-H HOST',
         long:        '--host HOST',
         default:     'localhost'

  option :port,
         description: 'Supervisor port',
         short:       '-P PORT',
         long:        '--port PORT',
         default:     9001

  option :username,
         description: 'Supervisor HTTP username',
         short:       '-u USERNAME',
         long:        '--username USERNAME'

  option :password,
         description: 'Supervisor HTTP password',
         short:       '-p PASSWORD',
         long:        '--password PASSWORD'

  option :critical,
         description: 'Supervisor states to consider critical',
         short:       '-c STATE[,STATE...]',
         long:        '--critical STATE[,STATE...]',
         proc:        proc { |v| v.upcase.split(',') },
         default:     ['FATAL']

  option :help,
         description: 'Show this message',
         short:       '-h',
         long:        '--help'

  def run
    if config[:help]
      puts opt_parser
      exit
    end

    params = {}

    if config[:username]
      params[:user] = config[:username]
    end

    if config[:password]
      params[:password] = config[:password]
    end

    begin
      @super = RubySupervisor::Client.new(config[:host], config[:port], params)
    rescue => e
      critical "Tried to access #{config[:host]} but failed: #{e}"
    end

    failed_processes = Set.new
    @super.processes.each do |process|
      failed_processes << "#{process['name']} not running: #{process['statename'].downcase}" if config[:critical].include?(process['statename'])
    end

    critical "\n#{failed_processes.to_a.join("\n")}" unless failed_processes.empty?

    ok 'All processes running'
  end # def run
end # class CheckSupervisor
