module Projects
  class CreateService < ApplicationService
    def initialize(user, project_params)
      @user = user
      @project_params = project_params
    end

    def call
      project = @user.projects.new(@project_params)

      return failure(I18n.t('projects.create.validation_failed'), project.errors) unless project.valid?

      ActiveRecord::Base.transaction do
        project.save!
      end

      success(project, I18n.t('projects.create.success'))
    rescue ActiveRecord::RecordInvalid => e
      failure(I18n.t('projects.create.failure'), e.record.errors)
    end
  end
end
