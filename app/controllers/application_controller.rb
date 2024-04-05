class ApplicationController < ActionController::Base
	  protect_from_forgery with: :null_session

	  def default_url_options
	    { locale: I18n.locale }
	  end
  
end
