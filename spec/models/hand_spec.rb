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
require 'rails_helper'

RSpec.describe Hand, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
