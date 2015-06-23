set :application, "Blublisher"
set :repo_url,  "https://github.com/SvenSeemann/blublisher.git"
set :deploy_to, "/var/www/blublisher"
set :scm, :git
set :branch, "master"

set :user, "root"
set :group, ""
set :pty, true

set :format, :pretty

set :rails_env, "production"
set :deploy_via, :copy
set :keep_releases, 5
set :passenger_restart_command, '-i passenger-config restart-app'

server "sven_1und1", user: 'root', roles: [:app, :web, :db], primary: true

set :linked_files, %w{config/database.yml config/config.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system}

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :keep_releases, 20

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :finishing, "deploy:cleanup"
