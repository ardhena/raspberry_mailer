lock '3.4.0'

set :application, 'raspberry_mailer'
set :repo_url, 'deployer@192.168.0.106:/home/olgad/git/raspberry_mailer.git'
set :pty, true

namespace :setup do
  task :bundle do
    on roles(:app) do
      execute "cd #{current_path} && /home/olgad/.rvm/gems/ruby-2.2.4/wrappers/bundle install --without deployment test"
    end
  end
end
