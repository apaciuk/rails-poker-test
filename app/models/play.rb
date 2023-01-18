# == Schema Information
#
# Table name: plays
#
#  id         :uuid             not null, primary key
#  status     :integer          default("stand"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_plays_on_status  (status)
#
class Play < ApplicationRecord
    belongs_to :user
    has_many :hands, class_name: 'Hand'
    has_many :cards, class_name: 'Card'
    enum status: {
        stand: 0,
        draw: 1,
    }

    def draw
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

    def play
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
            run_game
    end 

    def run_game
    @game_over = false
        if status == "stand"
            @game_over = true
            @player_hand.show_hand
        elsif status == "draw"
            draw
        else
        puts "Invalid input"
        end
    end 

    end
    end
