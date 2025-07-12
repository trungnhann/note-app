# == Schema Information
#
# Table name: tasks
#
#  id          :uuid             not null, primary key
#  title       :string           not null
#  description :text
#  completed   :boolean          default("false")
#  due_date    :date
#  priority    :integer          default("0")
#  project_id  :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("0")
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

class Task < ApplicationRecord
  belongs_to :project, optional: true

  validates :title, presence: true

  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }
  enum :status, { pending: 0, completed: 1 }

  scope :incomplete, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  scope :today, -> { where(due_date: Date.current) }
  scope :overdue, -> { where(due_date: ...Date.current) }

  def overdue?
    due_date.present? && due_date < Date.current && !completed?
  end
end
