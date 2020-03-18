module Api
  class RatesController < Api::BaseController
    def get_all_rates
      presenter = build_presenter

      render json: presenter.latest_rates
    end

    def currency_rate
      presenter = build_presenter
      currency = params[:code]

      render json: presenter.all_rates(currency)
    end

    def update_rates
      data = External::TinkoffApi.call
      RatesUpdaterService.call(data)

      render json: data
    end

    private

    def build_presenter
      RatesPresenter.new
    end
  end
end
