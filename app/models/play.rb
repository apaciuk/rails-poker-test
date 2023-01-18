# == Schema Information
#
# Table name: plays
#
#  id                         :uuid             not null, primary key
#  status(Status of the play) :string(10)       default("draw"), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_plays_on_status  (status)
#
class Play < ApplicationRecord
    has_and_belongs_to_many :hands, class_name: 'Hand'
    has_many :cards, through: :hands, class_name: 'Card', source: :cards, dependent: :destroy
    def play
        @game_over = false
        @deck = []
        face = %w[2 3 4 5 6 7 8 9 10 J Q K A].reverse
        suit = %w[C D H S].reverse
        face.each do |face|
            suit.each do |suit|
        @deck.push(Card.new(face: face, suit: suit))
            end 
        end
        @deck = @deck.shuffle!
        @player_hand = Hand.new(@deck.take(5))
        @player_hand.show_hand

        until @game_over
            puts "What would you like to do? (stand or draw?)"
            status = gets.chomp
            if status == "stand"
                @game_over = true
                puts "Game over!"
                @player_hand.show_hand
            elsif status == "draw"
                draw
            else
                puts "Invalid input"
            end
        end
    end 

    def draw 
        puts "How many cards would you like to give up?"
        number_of_new_cards = gets.chomp.to_i
        cards_to_discard = []
        count = 0
        while count < number_of_new_cards 
            @player_hand.show_hand_for_draw
            discard = gets.chomp.to_i
            cards_to_discard.push(discard)
            count += 1
            @player_hand.finish_draw(cards_to_discard, @deck)
            @player_hand.show_hand
        end
    end 
end

#Play.new
