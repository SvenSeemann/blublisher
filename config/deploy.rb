set :application, "Blublisher"
set :repo_url,  "https://github.com/SvenSeemann/blublisher.git"
set :deploy_to, "/var/www/blublisher"
set :scm, :git
set :branch, "master"
set :user, "root"
set :group, ""
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :keep_releases, 5
set :passenger_restart_command, '-i passenger-config restart-app'

server "sven_1und1", user: 'root'

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Symlink shared config files"
  task :symlink_config_files do
    run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end

  # NOTE: I don't use this anymore, but this is how I used to do it.
  desc "Precompile assets after deploy"
  task :precompile_assets do
    run <<-CMD
      cd #{ current_path } &&
      #{ sudo } bundle exec rake assets:precompile RAILS_ENV=#{ rails_env }
    CMD
  end

  desc "Restart applicaiton"
  task :restart do
    on "root@sven_1und1" do
      execute :touch, release_path.join(current_path, 'tmp', 'restart.txt')
    end
  end
end

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
