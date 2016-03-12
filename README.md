## Installation
```ShellSession  
  $ git clone https://github.com/Savinos90/sociopub  
  $ cd sociopub
  $ bundle install --without production
  $ bundle update
  $ bundle install
  $ bundle exec rake db:migrate
  $ rails s
```
Visit the root url http://localhost:3000/

== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
* Database creation
  pg
* Database initialization

* How to run the test suite
```ShellSession  
	$ sudo service postgresql start
	$ su - postgres
	$ psql -l
	$ pg_dump sociopub_development | psql -d sociopub_cucumber -W
	$ \dt
	$ delete from # table1, tables2. ..
	$ exit
	$ cd /path/to/sociopub/directory/
	$ bundle exec cucumber
```	
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
