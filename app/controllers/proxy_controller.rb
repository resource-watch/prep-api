class ProxyController < ApplicationController

  def index
    if params["url"]
      url = URI.parse(params["url"])
      if url.kind_of?(URI::HTTP)
        page = Net::HTTP.get_response(url)
          render :text => page.body
      else
        render :text => "Invalid url"
      end
    else
      render :text => "Url param is neccesary"
    end
  end

end
