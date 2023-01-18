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
FactoryBot.define do
  factory :hand do
    cards { "MyString" }
  end
end
