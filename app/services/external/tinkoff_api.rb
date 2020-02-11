# frozen_string_literal: true

module External
  class TinkoffApi < ApiService
    def initialize
      @request = RequestBuilder.new.tinkoff
      @connect = Faraday.new(@request)
    end

    def call
      super

      deposit_payments
    end

    private

    def deposit_payments
      string = Rails.configuration.faraday[:category]

      find_rates(string)
    end

    def find_rates(string)
      @response['payload']['rates'].select { |n| n['category'] == string }
    end
  end
end
