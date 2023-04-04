# run chmod 777 for this script to work

echo "Stopping postgres"
sudo /etc/init.d/postgresql stop

echo "Starting postgres"
pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start

echo "Running bundle install"
bundle install

echo "Starting Ruby on Rails server"
rails s