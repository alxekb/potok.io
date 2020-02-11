module Api
  class RatesController < Api::BaseController
    def get_rates
      render json: { rate: 'ok'}
    end

    def update_rates
      data = External::TinkoffApi.call
      RatesService.call(data)

      render json: data
    end
  end
end
