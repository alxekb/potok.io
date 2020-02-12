class RatesUpdaterService < AbstractService
  attr_reader :rates
  def initialize(data)
    @data = data
    @status = :error
    @currencies = Currency.all
    @rates = {}
  end

  def call
    request_has_new_currencies? ? present_rates : create_currencies
  end

  private

  def create_rate(rate)
    rate = Rate.new(category: rate['category'],
                           from_currency_id: rate.dig('fromCurrency', 'code'),
                           to_currency_id: rate.dig('toCurrency', 'code'),
                           buy: rate['buy'],
                           sell: rate['sell'])
    rate.save if rate.valid?

  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end

  def create_currencies
    ActiveRecord::Base.transaction do
      @data.map do |d|
        create_currency(d.dig('fromCurrency'))
        create_currency(d.dig('toCurrency'))
        create_rate(d)
      end
    end

    present_rates
  end

  def create_currency(currency)
    Currency.find_or_create_by(code: currency['code'],
                               name: currency['name'],
                               str_code: currency['strCode'])
  end

  def present_rates
    @rates = Rate.last(5)
  end

  def request_has_new_currencies?
    present_currency_ids = @currencies.map(&:code)
    request_currency_ids = @data.map do |d|
      [d.dig('fromCurrency', 'code'), d.dig('toCurrency', 'code')].flatten.uniq
    end

    present_currency_ids == request_currency_ids
  end
end
