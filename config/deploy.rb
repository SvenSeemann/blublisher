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

  desc 'Compile assets'
  task :local_compile_assets => [:set_rails_env] do
    # invoke 'deploy:assets:precompile'
    invoke 'deploy:assets:precompile_local'
  end

  namespace :assets do
    desc "Precompile assets locally and then rsync to web servers"
    task :precompile_local do
      # compile assets locally
      run_locally do
        execute "RAILS_ENV=#{fetch(:stage)} bundle exec rake assets:precompile"
      end

      # rsync to each server
      local_dir = "./public/assets/"
      on roles( fetch(:assets_roles, [:web]) ) do
        # this needs to be done outside run_locally in order for host to exist
        remote_dir = "#{host.user}@#{host.hostname}:#{shared_path}/public/assets/"

        run_locally { execute "rsync -av --delete #{local_dir} #{remote_dir}" }
      end

      # clean up
      run_locally { execute "rm -rf #{local_dir}" }
    end
  end

  after :updated, "deploy:local_compile_assets"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 1, wait: 10 do
      within release_path do
        execute :rake, 'db:migrate'
      end
    end
  end


end