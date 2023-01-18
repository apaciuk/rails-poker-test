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
FactoryBot.define do
  factory :play do
    status { 1 }
  end
end
