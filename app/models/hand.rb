class Hand < ApplicationRecord 
  has_many :cards, class_name: 'Card', dependent: :destroy, inverse_of: :hand
  belongs_to :play, class_name: 'Play'
  attr_accessor :cards, :face, :suit
  def cards
    @cards = cards
  end

  def finish_draw(cards_to_discard, deck)
    cards_to_discard.each do |card|
        @cards.delete_at(card)
        end
    deck.shuffle!
    puts "Old cards: #{@cards}"
    @cards += deck.take(cards_to_discard.length)
    puts "New cards: #{@cards}"
    @cards
  end

  def show_hand
    @cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end 

  def show_hand_for_draw
    @cards.each_with_index do |card, index|
      puts "#{index + 1}: #{card.face}#{card.suit}"
    end
  end

end