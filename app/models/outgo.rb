class Outgo < ActiveRecord::Base
  belongs_to :user
  monetize :price_cents
end
