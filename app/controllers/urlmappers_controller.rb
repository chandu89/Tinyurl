class UrlmappersController < ApplicationController

	def index
		@urlmappers = Urlmapper.order(visit_count: :desc).limit(100)
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
			    format.html { redirect_to @urlmapper, notice: 'new was successfully created.' }
			  else
			    format.html { render :new }
			  end
			end
		else
			@urlmapper.increment!(:visit_count, 1)
			respond_to do |format|
			    format.html { redirect_to @urlmapper, notice: 'new was successfully created.' }
			end
		end
	end

	# Its redirect from shorted URL to original site eg abc-> google.com
	def redirected_site
		urlmapper = Urlmapper.find_by_tinyurl(params[:tinyurl])
		url = urlmapper.url
		redirect_to url
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

	# adding if not http or https present in your URL 
	# Though its not needed but extra protection i added
	# you can simply return URL it will open
	def url_redirect(url)
		(url.include?("htpp://") || url.include?("htpps://") ? url : "https://"+url)
	end

end
