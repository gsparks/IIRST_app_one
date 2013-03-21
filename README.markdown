# Ruby on Rails Tutorial: sample application

This is the sample application for [*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/) by [Michael Hartl](http://michaelhartl.com/).

#################################################################
# Instructions for installing IIRST
#################################################################

# Section I => Installing the loadtime functionality

1.  $ rails generate scaffold Loadtime loadtime:float page:string date:string

2.  Make sure your loadtime.rb file located in /app/models/loadtime.rb looks like this...

	class Loadtime < ActiveRecord::Base
  		attr_accessible :loadtime, :page, :date
  		validates :loadtime, :presence => true
  		validates :page, :presence => true
  		validates :date, :presence => true
	end
	
3.  $ rake db:migrate
	
4.  Start the server and navigate to the localhost:3000/loadtimes.  It should exist.

5.  Insert the following code at top of each page definition in your pages controller and at the top of every other controller ...

	@start_time_in_controller = Time.now
	
6.  Insert the following code at the end of each view...

	<%= "Took #{Time.now - @start_time_in_controller} seconds to load." %>
	<%= p = Loadtime.new(:loadtime => (Time.now - @start_time_in_controller), :page => "contact", :date => Time.now) %>
	<%= p.save %>
	
7.  Restart the server and visit each page.  Then go back to localhost:3000/loadtimes and there should be a list of each page's respective loadtime.

8.  Insert the following into your Gemfile...

	gem 'rack-mini-profiler'
	
9.  $ bundle install

10. Insert the following code into your application controller located at /app/controllers/application_controller.rb...

	def authorize
  		if current_user.is_admin?
    		Rack::MiniProfiler.authorize_request
  		end
	end
	
11. Restart the server and use the app.  There should now be a profiling box in the upper left-hand corner.

# Section II => Installing the network functionality

1.  $ rails generate scaffold Network latency:integer jitter:string date:string

2.  Make sure network.rb located in app/models/network.rb looks like…

	class Network < ActiveRecord::Base
		attr_accessible :latency, :jitter, :date
		validates :latency, :presence => true
   		validates :jitter, :presence => true
   		validates :date, :presence => true
	end

3.  $ rake db:migrate

4.  Navigate to localhost:3000/networks.  A page should exist that attempts to list network changes.

5.  Place this code in application.rb within the config folder…
    
# Section III Installing the User simulation functionality

Terminal command to kick off Selenim test...
java -jar selenium-server-standalone-2.31.0.jar -htmlSuite "*googlechrome" http://localhost:3000 mytestsuite.html results.html

1.  $ rails generate scaffold Usersimulation status:string interval:integer numsims:integer

2.  Make sure usersimulation.rb located in app/models/usersimulation.rb looks like…

	class Usersimulation < ActiveRecord::Base
		attr_accessible :latency, :jitter, :date
		validates :status, :presence => true
   		validates :interval, :presence => true
   		validates :numsims, :presence => true
	end

3.  $ rake db:migrate

4.  Navigate to localhost:3000/usersimulations.  A page should exist.
