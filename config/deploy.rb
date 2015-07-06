# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'blublisher'
set :repo_url, 'git@github.com:SvenSeemann/blublisher.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/blublisher'
set :tmp_dir, "#{fetch(:home)}/tmp"
set :keep_releases, 5

# Config for puma
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_preload_app, true
set :puma_init_active_record, true

set :ssh_options, :compression => false, :keepalive => true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :updated, "assets:precompile"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 1, wait: 10 do
      within release_path do
        execute :rake, 'db:migrate'
      end
    end
  end
end

namespace :assets do
  desc "Precompile assets locally and then rsync to web servers"
  task :precompile do
    on roles(:web) do
      rsync_host = host.to_s # this needs to be done outside run_locally in order for host to exist
      run_locally do
        with rails_env: fetch(:stage) do
          execute :bundle, "exec rake assets:precompile"
        end
        execute "rsync -av --delete ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/"
        execute "rm -rf public/assets"
        # execute "rm -rf tmp/cache/assets" # in case you are not seeing changes
      end
    end
  end
end