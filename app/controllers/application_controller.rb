class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :host_uri

  # It returns host URl
  def host_uri
    Rails.env.production? ? 'http://www.tinmini.com/' : root_url
  end

end
