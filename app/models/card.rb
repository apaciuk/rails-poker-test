class Card < ApplicationRecord
    belongs_to :hand, class_name: 'Hand'
    belongs_to :play, class_name: 'Play'
    attr_accessor :face, :suit  
    def card(face, suit)
        @face = face
        @suit = suit
    end
end
