class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout  :determine_layout
  
protected
  def determine_layout
    if user_signed_in?
      'application'
    else
     'sign'
    end
  end
end
