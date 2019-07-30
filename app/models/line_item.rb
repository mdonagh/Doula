class LineItem < ApplicationRecord
  belongs_to :services
  belongs_to :cart
end
