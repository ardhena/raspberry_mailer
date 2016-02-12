lock '3.4.0'

set :application, 'raspberry_mailer'
set :repo_url, 'olgad@192.168.0.106:/home/olgad/git/raspberry_mailer.git'
set :pty, true

namespace :setup do
  task :bundle do
    on roles(:app) do
      execute "cd #{current_path} && /home/olgad/.rvm/gems/ruby-2.2.4/wrappers/bundle install"
    end
  end
end
