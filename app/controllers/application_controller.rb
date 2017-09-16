class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :host_uri

  def host_uri
    Rails.env.production? ? 'https://stormy-cove-10376.herokuapp.com/' : root_url
  end

end
