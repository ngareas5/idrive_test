class Product < ApplicationRecord

  def self.exchange_currency(price,currency,rate)
    price = price*rate.to_f
    price.round(2)
    #Concurrency.convert(price, currency).round(2)
  end

end
