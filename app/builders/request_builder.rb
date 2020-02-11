class RequestBuilder
  attr_accessor :url, :params, :headers

  def initialize
    @url = 'http://example.com'
    @params = {}
    @headers = { 'Content-Type' => 'application/json' }
  end

  def build
    { url: @url, params: @params, headers: @headers }
  end

  def tinkoff
    { url: @url = Rails.configuration.faraday[:tinkoff_url], params: @params, headers: @headers }
  end
end
