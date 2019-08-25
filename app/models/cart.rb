class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy 

    def purchase_increments(service, quantity)
        
    end 
end
