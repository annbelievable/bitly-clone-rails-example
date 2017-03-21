class UrlsController < ApplicationController
  def new
    @short_url = session[:url]
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      # http://api.rubyonrails.org/classes/ActionController/MimeResponds.html
      respond_to do |format|
        format.html { redirect_to new_url_path(url: @url.short_url) }
        format.js {}
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js {}
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
