# == Schema Information
#
# Table name: cards
#
#  id         :uuid             not null, primary key
#  face       :string           default(""), not null
#  suit       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Card < ApplicationRecord
  belongs_to :play, class_name: 'Play'
  has_and_belongs_to_many :hands, class_name: 'Hand', inverse_of: :cards, dependent: :destroy
   attr_accessor :face, :suit  
    def initialize(face, suit) 
        @face = face
        @suit = suit
    end
end
