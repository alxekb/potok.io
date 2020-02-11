class Currency < ApplicationRecord
  has_many :rates

  scope :latest_rates, -> { joins(:rates).where rate }
end
