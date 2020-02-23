# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :questions, dependent: :destroy, inverse_of: :asker
  has_many :answers, dependent: :destroy, inverse_of: :answerer

  validates :name, presence: true
end
