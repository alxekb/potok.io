
class RatesPresenter
  def latest_rates
    Rate.latest
  end

  def all_rates(currency)
    Rate.where({ from_currency_id: currency, to_currency_id: currency })
  end
end
