class ProxyController < ApplicationController
  def index
    url = URI.parse(params["url"])
    page = Net::HTTP.get_response(url)
      render :text => page.body
  end
end
