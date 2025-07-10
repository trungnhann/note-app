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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
