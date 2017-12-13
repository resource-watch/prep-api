module ApiHelper
  def connect_gateway
    Faraday.new(url: "#{ENV['APIGATEWAY_URL']}") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end