class Urlmapper < ActiveRecord::Base
	validate :url_validator

	# Only widely used extension are present and validation will not check full url
	# validation is almost same as bitly
  def url_validator
    uri = URI.parse(self.url)
    unless uri.is_a?(URI::HTTP) && !uri.host.nil?
      errors.add(:url, "url not valid")
    end
  end

	# adding if not http or https present in your URL 
	# Though its not needed but extra protection i added
	# you can simply return URL it will open
  def url_redirect
  	url = self.url
  	(url.include?("http://") || url.include?("https://") ? url : "http://"+url)
  end
end
