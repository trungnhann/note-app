module Projects
  class DeleteService < ApplicationService
    def initialize(user, project_id)
      @user = user
      @project_id = project_id
    end

    def call
      project = Project.find(@project_id)

      project.destroy

      success(message: I18n.t('projects.delete.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('projects.delete.not_found'), { base: e.message })
    end
  end
end
