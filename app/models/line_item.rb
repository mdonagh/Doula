class LineItem < ApplicationRecord
  belongs_to :registry_service
  belongs_to :cart
end
