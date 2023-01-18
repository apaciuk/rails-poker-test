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
require 'rails_helper'

RSpec.describe Play, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
