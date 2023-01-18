# == Schema Information
#
# Table name: hands
#
#  id                       :uuid             not null, primary key
#  cards(Cards in the hand) :string           default([]), not null, is an Array
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_hands_on_cards  (cards)
#
class Hand < ApplicationRecord
    has_and_belongs_to_many :plays, class_name: 'Play'
    has_many :cards, through: :play, class_name: 'Card', source: :cards
    def initialize(cards)
        @cards = cards
    end 

    def finish_draw(cards_to_discard, deck)
    cards_to_discard.each do |card|
        @cards.delete_at(card)
        end
    deck.shuffle!
    puts "Old cards: #{@cards}"
    new_cards = deck.take(cards_to_discard.count)
    puts "New cards: #{new_cards}"
    @cards = @cards + new_cards
    end

    def show_hand 
    puts "Your hand is:"
    @cards.each do |card|
        puts "#{card.face}#{card.suit}"
        end
    end 
        
    def show_hand_for_draw
    puts "Enter the number below to give up that card"
    @cards.each do |card|
        puts "#{card.face}#{card.suit}"
        end
    end
end
