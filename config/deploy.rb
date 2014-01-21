require 'bundler/capistrano'
require "rvm/capistrano"

set :application, "benhoad.net"
set :repository,  "git@github.com:benhoad/bloge.git"

role :web, "192.34.59.191"
role :app, "192.34.59.191"
role :db,  "192.34.59.191", :primary => true 

set :user, "root"
set :runner,                     "www-data"
set :admin_runner,               "www-data"
set :scm,                        :git
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :use_sudo, false

set :deploy_to, "/home/rails/"
set :deploy_via, :copy

set :normalize_asset_timestamps, false
set :rvm_type, :system