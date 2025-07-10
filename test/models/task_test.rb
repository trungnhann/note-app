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
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
