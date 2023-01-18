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
FactoryBot.define do
  factory :play do
    status { "MyString" }
  end
end
