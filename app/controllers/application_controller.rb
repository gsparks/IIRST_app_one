class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def authorize
    if current_user.is_admin? 
      Rack::MiniProfiler.authorize_request
    end
  end

end
