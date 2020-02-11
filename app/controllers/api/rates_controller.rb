module Api
  class RatesController < Api::BaseController
    def get_rates
      render json: { rate: 'ok'}
    end

    def update_rates
      render json: External::TinkoffApi.call
    end
  end
end
