module Tasks
  class DeleteService < ApplicationService
    def initialize(user, task_id)
      @user = user
      @task_id = task_id
    end

    def call
      task = Task.find(@task_id)

      task.destroy

      success(message: I18n.t('tasks.delete.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('tasks.delete.not_found'), { base: e.message })
    rescue Pundit::NotAuthorizedError
      failure(I18n.t('tasks.delete.unauthorized'))
    end

  end
end