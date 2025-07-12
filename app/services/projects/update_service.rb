module Projects
  class UpdateService < ApplicationService
    def initialize(user, project_id, project_params)
      @user = user
      @project_id = project_id
      @project_params = project_params
    end

    def call
      project = Project.find(@project_id)

      return failure(I18n.t('projects.update.validation_failed'), project.errors) unless project.update(@project_params)

      success(project, I18n.t('projects.update.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('projects.update.not_found'), { base: e.message })
    rescue ActiveRecord::RecordInvalid => e
      failure(I18n.t('projects.update.failure'), e.record.errors)
    end
  end
end
