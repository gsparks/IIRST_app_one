require 'pathname'
class Appender

  attr_reader :code, :destination_type, :path

  def initialize(path, code, mode, erase_all)
    @path = path
    @code = code
    insert(mode, erase_all)
  end

  def insert(mode, start_over)
    File.new(@path, "w") if start_over
    if (mode == 'bottom')
      if (@path)
        File.open(@path, 'a+') { |file| file.puts @code }
      end
    elsif (mode == 'top')
      if (@path)
        newfile = File.new(@path + ".new","w")
        newfile.puts @code
        
        oldfile = File.open(@path, "r+")
        oldfile.each_line { |line| newfile.puts line}
        
        oldfile.close()
        newfile.close()
        
        File.delete(@path)
        File.rename(@path + ".new", @path)
      end
    end
  end
end

puts "Installing IIRST \n loadtime functionality => Part 1 of 3..."
`rails generate scaffold Loadtime loadtime:float page:string date:string`
appender = Appender.new("app/models/loadtime.rb", "class Loadtime < ActiveRecord::Base\nattr_accessible :loadtime, :page, :date\n  validates :loadtime, :presence => true\n  validates :page, :presence => true\n  validates :date, :presence => true\nend", "top", true)
appender = Appender.new("app/views/loadtimes/index.html.erb", "<% if Network.last != nil %>\n<% if Network.last.jitter.to_s == 'true' %>\n  <% sleep rand(Network.last.latency.to_i) %>\n<% else sleep Network.last.latency.to_i %>\n<% end %>\n<% end %>\n<h1>Listing loadtimes</h1>\n<% x = 0 %>\n<% @loadtimes.each do |loadtime| %>\n<% x = x + loadtime.loadtime %>\n<% end %>\n<% x = x / @loadtimes.size %>\n<h4> Average total loadtime: <%= x %> seconds </h4>\n<table>\n<tr>\n<th>Loadtime</th>\n<th>Page</th>\n<th>Date</th>\n<th></th>\n<th></th>\n<th></th>\n</tr>\n<% Loadtime.find(:all, :order => 'id desc', :limit => 50).each do |loadtime| %>\n<tr>\n<td><%= loadtime.loadtime %></td>\n<td><%= loadtime.page %></td>\n<td><%= loadtime.date %></td>\n</tr>\n<% end %>\n</table>\n<br />\n<%= link_to 'New Loadtime', new_loadtime_path %>", "top", true)
Pathname("app/views/pages").each_child {|f| appender = Appender.new(f.to_s, "\n<% if @title != nil %>\n  <%= p = Loadtime.new(:loadtime => (Time.now - @start_time_in_controller), :page => @title.downcase, :date => Time.now)%>\n  <%= p.save %>\n<% else%>\n  <%= puts 'loadtime error: failed to record loadtimes' %>\n<% end %>", "bottom", false) }
puts "Insert the following code at top of each page definition in your pages controller and at the top of every other controller ...\n  @start_time_in_controller = Time.now\nPress Enter When Finished"
`read enterKey`
appender = Appender.new("Gemfile", "gem 'rack-mini-profiler'\ngem 'rufus-scheduler'\ngem 'parallel'", "bottom", false)
puts "Insert this code into your application_controller..."
puts "def authorize\n  if current_user.is_admin?\n    Rack::MiniProfiler.authorize_request\n  end\nend\n\nPress Enter When Finished"
`read enterKey`
puts "Installing IIRST \n network functionality => Part 2 of 3..."
`rails generate scaffold Network latency:integer jitter:string date:string`
appender = Appender.new("app/models/network.rb", "class Network < ActiveRecord::Base\nattr_accessible :latency, :jitter, :date\nvalidates :latency, :presence => true\nvalidates :jitter, :presence => true\nvalidates :date, :presence => true\nend", "top", true)
Pathname("app/views/").each_child {|f| Pathname("#{f.to_s}").each_child {|t| appender = Appender.new(t.to_s, "<% if Network.last != nil %>\n<% if Network.last.jitter.to_s == 'true' %>\n  <% sleep rand(Network.last.latency.to_i) %>\n<% else sleep Network.last.latency.to_i %>\n<% end %>\n<% end %>", "top", false) } }
appender = Appender.new("app/views/networks/index.html.erb", "<% if Network.last != nil %>\n<% if Network.last.jitter.to_s == 'true' %>\n<% sleep rand(Network.last.latency.to_i) %>\n<% else sleep Network.last.latency.to_i %>\n<% end %>\n<% end %>\n<h1>Current Network Settings</h1>\n<% if Network.last != nil %>\n<table>\n<tr>\n<th>Latency</th>\n<th>Jitter</th>\n<th>Date</th>\n<th></th>\n<th></th>\n<th></th>\n</tr>\n<% network = @networks.last %>\n<tr>\n<td><%= network.latency %></td>\n<td><%= network.jitter %></td>\n<td><%= network.date %></td>\n</tr>\n</table>\n<% end %>\n<br />\n<h1>Change Network Settings</h1>\n<% form_tag('/networks', :method => 'get') do %>\n<label for='latency'>Latency (in seconds): </label>\n<%= text_field_tag :latency %>\n<br>\n<label for='jitter'>Jitter (true or false): </label>\n<%= text_field_tag :jitter %>\n<br>\n<%= submit_tag 'Submit' %>\n<% end %>\n<br>\n<% p = Network.new(:latency => params[:latency].to_i, :jitter => params[:jitter], :date => Time.now) %>\n<% p.save %>", "top", true)
puts "Installing IIRST \n user simulation functionality => Part 3 of 3..."
`rails generate scaffold Usersimulation status:string interval:integer numsims:integer`
appender = Appender.new("app/models/usersimulation.rb", "class Usersimulation < ActiveRecord::Base\nattr_accessible :status, :interval, :numsims\nvalidates :status, :presence => true\nvalidates :interval, :presence => true\nvalidates :numsims, :presence => true\nend", "top", true)
appender = Appender.new("app/controllers/usersimulations_controller.rb", "require 'rufus/scheduler'\nrequire 'parallel'\nclass UsersimulationsController < ApplicationController\ndef index\n@usersimulations = Usersimulation.all\nrespond_to do |format|\nformat.html # index.html.erb\nformat.xml  { render :xml => @usersimulations }\nif @usersimulations.last != nil\nscheduler = Rufus::Scheduler.start_new\nif @usersimulations.last.status.to_s == 'true'\nx = @usersimulations.last.interval\nl = 0\nscheduler.every 'x'.gsub(/[x]/, 'x' => x) do |job|\nif l >= 3\nputs 'Stress testing finished running'\njob.unschedule\nelse\nl += 1\nputs 'Stress testing currently running'\nnumsims = @usersimulations.last.numsims\nParallel.each(1..numsims, :in_processes => numsims) do\n`java -jar selenium-server-standalone-2.31.0.jar -htmlSuite '*googlechrome' http://localhost:3000 mytestsuite.html results.html`\nend\nend\nend\nend\nend\nend\nend\ndef show\n@usersimulation = Usersimulation.find(params[:id])\nrespond_to do |format|\nformat.html # show.html.erb\nformat.xml  { render :xml => @usersimulation }\nend\nend\ndef new\n@usersimulation = Usersimulation.new\n respond_to do |format|\nformat.html # new.html.erb\nformat.xml  { render :xml => @usersimulation }\nend\nend\ndef edit\n@usersimulation = Usersimulation.find(params[:id])\nend\ndef create\n@usersimulation = Usersimulation.new(params[:usersimulation])\nrespond_to do |format|\nif @usersimulation.save\nformat.html { redirect_to(@usersimulation, :notice => 'Usersimulation was successfully created.') }\nformat.xml  { render :xml => @usersimulation, :status => :created, :location => @usersimulation }\nelse\nformat.html { render :action => 'new' }\nformat.xml  { render :xml => @usersimulation.errors, :status => :unprocessable_entity }\nend\nend\nend\ndef update\n@usersimulation = Usersimulation.find(params[:id])\n respond_to do |format|\nif @usersimulation.update_attributes(params[:usersimulation])\nformat.html { redirect_to(@usersimulation, :notice => 'Usersimulation was successfully updated.') }\nformat.xml  { head :ok }\nelse\nformat.html { render :action => 'edit' }\nformat.xml  { render :xml => @usersimulation.errors, :status => :unprocessable_entity }\nend\nend\nend\ndef destroy\n@usersimulation = Usersimulation.find(params[:id])\n@usersimulation.destroy\nrespond_to do |format|\nformat.html { redirect_to(usersimulations_url) }\nformat.xml  { head :ok }\nend\nend\nend", "top", true)
appender = Appender.new("app/views/usersimulations/index.html.erb", "<% if Network.last != nil %>\n<% if Network.last.jitter.to_s == 'true' %>\n<% sleep rand(Network.last.latency.to_i) %>\n<% else sleep Network.last.latency.to_i %>\n<% end %>\n<% end %>\n<% if @usersimulations.last != nil %>\n<% if @usersimulations.last != nil %>\n<h1>Current UserSim Settings</h1>\n<table>\n<tr>\n<th>Status</th>\n<th>Interval</th>\n<th>Numsims</th>\n<th></th>\n<th></th>\n<th></th>\n</tr>\n<% x = @usersimulations.last %>\n<tr>\n<td><%= x.status %></td>\n<td><%= x.interval %></td>\n<td><%= x.numsims %></td>\n</tr>\n</table>\n<br />\n<% end %>\n<% end %>\n<h1>Change User Simulation Settings</h1>\n<% form_tag('/usersimulations', :method => 'get') do %>\n<label for='status'>Status (true or false): </label>\n<%= text_field_tag :status %>\n<br>\n<label for='interval'>Interval (seconds): </label>\n<%= text_field_tag :interval %>\n<br>\n<label for='numsims'>Numsims (how many users to emulate): </label>\n<%= text_field_tag :numsims %>\n<br>\n<%= submit_tag 'Submit' %>\n<% end %>\n<br>\n<% p = Usersimulation.new(:status => params[:status].to_s, :interval => params[:interval], :numsims => params[:numsims]) %>\n<% p.save %>", "top", true)
`bundle update`
`rake db:migrate`
puts "Place an html selenium test of your application as well as the selenium server .jar file into the app's root."
puts "Press Enter when done"
`read enterKey`
puts "IIRST Installed Succesfully!"