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
  namespace :assets do

    Rake::Task['deploy:assets:precompile'].clear_actions

    desc 'Precompile assets locally and upload to servers'
    task :precompile do
      on roles(fetch(:assets_roles)) do
        run_locally do
          with rails_env: fetch(:rails_env) do
            execute 'bin/rake assets:precompile'
          end
        end

        within release_path do
          with rails_env: fetch(:rails_env) do
            upload!('./public/assets/', "#{shared_path}/public/", { recursive: true, mode: 777 } )
          end
        end

        run_locally { execute 'rm -rf public/assets' }
      end
    end

  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 1, wait: 10 do
      within release_path do
        execute :rake, 'db:migrate'
      end
    end
  end
end