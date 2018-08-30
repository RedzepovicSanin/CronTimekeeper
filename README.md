# README

After cloning this repo, first, you need to enter 'bundle install' in terminal.

Inside 'config' folder, open 'routes.db' file and put a comment on devise_for line.

Run 'rake db:migrate' and after that 'rake db:seed' to get custom users in application.
You can find those in folder db/seeds.rb and their informations.

After migrating and seeding, uncomment line you previously commented.

Everything else is based on your preferences. Enjoy!
