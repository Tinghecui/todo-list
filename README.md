Steps to run:

bundle install --without production
bin/rake db:setup # shorthand for db:create, db:migrate, db:seed
bin/rails server -b 0.0.0.0