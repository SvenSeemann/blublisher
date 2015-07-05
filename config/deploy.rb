# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'blublisher'
set :repo_url, 'ssh://git@github.com:SvenSeemann/blublisher.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/blublisher'

set :keep_releases, 5

# Config for puma
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_preload_app, true
set :puma_init_active_record, true



# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, 'assets:precompile'
      end
    end
  end

end