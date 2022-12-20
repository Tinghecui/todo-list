### Names and UNIs:  
- Haobo Liu (hl3645)   
- Tinghe Cui (tc3162)   
- Rahul Roy (rnr2127)   
- Yongfei Tan (yt2775)  
  
  
### Steps to run:  
```
bundle install --without production  
bin/rake db:reset
rails server -b 0.0.0.0  
```

### Steps to test:  
```
bundle exec rake spec
bundle exec cucumber
```

### Heroku deployment link:
[Heroku Link](https://gentle-ridge-18175.herokuapp.com)  
User can log in with existed account:  
```
email: test123@gmail.com  
password: 123456
```

### Environment & Other details:  
Branch - proj-launch  
Ruby version -  2.6.8  
OS - Mac  
Devise Authentication - Devise 4.7.3  [Devise](https://github.com/heartcombo/devise)


