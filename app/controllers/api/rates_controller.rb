module Api
  class RatesController < Api::BaseController
    def get_rates
      render json: { 123 => '123'}
    end

    def update_rates
        render json: { message: 'Rate update request has been submitted.' } # TODO: add locale
    end
  end
end
