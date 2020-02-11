# frozen_string_literal: true

module External
  class ApiService < ::AbstractService
    def initialize
      @request = RequestBuilder.new.build
      @connect = Faraday.new(@request)
      @response = {}
    end

    def call
      response = @connect.get

      @response = JSON.parse(response.body)
    end
  end
end
