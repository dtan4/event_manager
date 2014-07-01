# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'event_manager'
set :repo_url, 'git@github.com:dtan4/event_manager.git'
set :deploy_to, '/var/www/event_manager'
set :scm, :git
set :keep_releases, 5

set :default_env, {
                   rbenv_root: "/opt/rbenv",
                   path: "/opt/rbenv/shims:/opt/rbenv/bin:$PATH"
                  }

set :linked_dirs, (fetch(:linked_dirs) + ["tmp/pids"])

set :unicorn_rack_env, "none"
set :unicorn_config_path, "config/unicorn.rb"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke "unicorn:restart"
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
