class Product < ApplicationRecord

  def self.exchange_currency(price,currency)
    Concurrency.convert(price, currency).round(2)
  end

end
