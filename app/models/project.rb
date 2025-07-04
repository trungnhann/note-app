# == Schema Information
#
# Table name: projects
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  color       :string
#  archived    :boolean          default("false"), not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  scope :active, -> { where(archived: false) }
end
