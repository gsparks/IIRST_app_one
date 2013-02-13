class PagesController < ApplicationController

  def home
    @start_time_in_controller = Time.now
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @start_time_in_controller = Time.now
    @title = "Contact"
  end
  
  def about
    @start_time_in_controller = Time.now
    @title = "About"
  end
  
  def help
    @start_time_in_controller = Time.now
    @title = "Help"
  end

  def loadtimes
    @start_time_in_controller = Time.now
    @title = "Load Times"
  end
end
