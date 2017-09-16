class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :host_uri

  def host_uri
    Rails.env.production? ? 'http://www.herokuapp.com' : root_url
  end

end
