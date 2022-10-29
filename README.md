Names and UNIs:
Haobo Liu (hl3645),
Tinghe Cui (tc3162), 
Rahul Roy (rnr2127),
Yongfei Tan (yt2775)


Steps to run:

bundle install --without production
bin/rake db:setup # shorthand for db:create, db:migrate, db:seed
bin/rails server -b 0.0.0.0
