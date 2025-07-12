module Projects
  class ShowService < ApplicationService
    def initialize(user, project_id)
      @user = user
      @project_id = project_id
    end

    def call
      project = Project.find(@project_id)

      success(project, I18n.t('projects.show.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('projects.show.not_found'), { base: e.message })
    end
  end
end
