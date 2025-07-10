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
#  user_id     :uuid             not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  scope :active, -> { where(archived: false) }
end
