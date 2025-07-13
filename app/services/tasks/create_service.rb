module Tasks
  class CreateService < ApplicationService
    def initialize(user, task_params)
      @user = user
      @task_params = task_params
    end

    def call
      project = Project.find(@task_params[:project_id])
      authorize_project(project)

      task = project.tasks.new(@task_params)

      return failure(I18n.t('tasks.create.validation_failed'), task.errors) unless task.valid?

      ActiveRecord::Base.transaction do
        task.save!
      end

      success(task, I18n.t('tasks.create.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('tasks.create.project_not_found'), { base: e.message })
    rescue ActiveRecord::RecordInvalid => e
      failure(I18n.t('tasks.create.failure'), e.record.errors)
    rescue Pundit::NotAuthorizedError
      failure(I18n.t('tasks.create.unauthorized'))
    end

    private

    def authorize_project(project)
      Pundit.authorize(@user, project, :show?)
    end
  end
end