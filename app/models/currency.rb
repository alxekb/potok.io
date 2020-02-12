class Currency < ApplicationRecord
  self.primary_key = 'code'

  has_many :buy_rates, class_name: 'Rate', foreign_key: :from_currency_id
  has_many :sell_rates, class_name: 'Rate', foreign_key: :to_currency_id

  # scope :latest_rate, -> { joins(:rates).where rate }

  def id
    raise NoMethodError, "Please call #{self.class.primary_key} instead."
  end

end
