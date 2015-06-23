set :application, "Blublisher"
set :repo_url,  "https://github.com/SvenSeemann/blublisher.git"
set :deploy_to, "/var/www/blublisher"
set :scm, :git

set :ssh_options, {
  forward_agent: true,
  port: 3456
}

set :log_level, :info
server "sven_1und1", user: 'root', roles: [:app, :web, :db], primary: true

set :linked_files, %w{config/database.yml}
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
end