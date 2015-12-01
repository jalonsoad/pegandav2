set :application, "peganda.com"
set :host, "146.255.96.152"


set :deploy_to, '/var/www/vhost/#{application}'
set :deploy_via, :remote_cache
set :use_sudo, false
set :keep_releases, 3


# deploy with git
set :scm, :git
set :repository, 'git@github.com:jalonsoad/pegandaV2.git'
set :branch, "master"
set :scm_verbose, true
set :user, "deploy"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true




#server "www.peganda.com", :app, :web, :db, :primary => true
role :web, "146.255.96.152"  # Your HTTP server, Apache/etc
role :app, "146.255.96.152"  # This may be the same as your `Web` server
role :db,  "146.255.96.152", :primary => true  # This is where Rails migrations will run




# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"


# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end


#namespace :deploy do
#  task :start do ; end
#  task :stop do ; end
#  desc 'Restart application'
#  task :restart do
#    on roles(:app), in: :sequence, wait: 5 do
#      execute :mkdir, '-p', "#{ release_path }/tmp"
#     execute :touch, release_path.join('tmp/restart.txt')
#    end
#  end

#  after :publishing, 'deploy:restart'
#  after :finishing, 'deploy:cleanup'
#end



#set :ssh_options, {:forward_agent => true}
#set :default_run_options, {:pty => true}
#set :stages, ["production"]
#set :default_stage, "production"
#set :deploy_user, 'deploy'
