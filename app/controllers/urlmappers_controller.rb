class UrlmappersController < ApplicationController
	before_action :set_ip, only: [:index]

	def index
		@urlmappers = Rails.cache.fetch("urlmapper_index_cache", race_condition_ttl: 10, expires_in: 1.hour) do
           Urlmapper.order(visit_count: :desc).all
      	end

      	@urlmappers = @urlmappers.page(params[:page]).per(6)
		render :layout => false
	end

	def new
		@urlmapper = Urlmapper.new
	end

	def show
		@urlmapper = Urlmapper.find(params[:id]).decorate
	end

	# create a record only if its not there otherwise increase visit count
	def create
		@urlmapper = Urlmapper.where(:url =>post_params[:url]).first
		if @urlmapper.blank?
			@urlmapper = Urlmapper.new(post_params)
			@urlmapper.tinyurl = tinify(post_params[:url])
			@urlmapper.visit_count = 1
			respond_to do |format|
			  if @urlmapper.save
			    format.js
			  else
			    format.js
			  end
			end
		else
			@urlmapper.increment!(:visit_count, 1)
			respond_to do |format|
			    format.js 
			end
		end
	end

	# Its redirect from shorted URL to original site eg abc-> google.com
	def redirected_site
		urlmapper = Urlmapper.find_by_tinyurl(params[:tinyurl])
		redirect_to urlmapper.url_redirect
	end

	private

	# Strong parameters 
	def post_params
		params.require(:urlmapper).permit(:url)
	end

	# shortening long URL to short
	def tinify(url)
		hash_url = Digest::SHA1.hexdigest(url)
		tiny = hash_url.reverse.split("").map(&:to_i).uniq.join("").to_i.to_s(36)
	end

	# setting remote IP

	def set_ip
		remote_ip = request.remote_ip 
		geoip = GeoIP.new("#{Rails.root}/db/GeoIP.dat") 
		if remote_ip != "127.0.0.1"
		  location_location = geoip.country(remote_ip)
		  if location_location != nil   
		    @@user_ip ||= UserIp.create(:remote_ip=> remote_ip, :country=> location_location.country_name)
		  end
		end
	end
end
