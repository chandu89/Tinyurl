class Urlmapper < ActiveRecord::Base
	validate :url_validator

	# Only widely used extension are present and validation will not check full url
	# validation is almost same as bitly
	TYPES = %w{ de edu org in com int gov mil de}
  def url_validator
  	url_extension = self.url.split(".").last

    unless TYPES.include? url_extension
      errors.add(:url, "url not valid")
    end
  end
end
