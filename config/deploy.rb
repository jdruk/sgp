lock "3.8.1"

set :application, "sgp"
set :repo_url, "https://github.com/jdruk/sgp.git"

set :deploy_to, "/home/deploy/sgp"

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

set :keep_releases, 2
