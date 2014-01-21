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

deploy.task :restart, roles: :app do
  # Fix Permissions
  sudo "chown -R www-data:www-data #{current_path}"
  sudo "chown -R www-data:www-data #{latest_release}"
  sudo "chown -R www-data:www-data #{shared_path}/bundle"
  sudo "chown -R www-data:www-data #{shared_path}/log"
  
  # Restart Application
  run "service unicorn restart"
end