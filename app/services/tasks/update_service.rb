module Tasks
  class UpdateService < ApplicationService
    def initialize(user, task_id, task_params)
      @user = user
      @task_id = task_id
      @task_params = task_params
    end

    def call
      task = Task.find(@task_id)

      return failure(I18n.t('tasks.update.validation_failed'), task.errors) unless task.update(@task_params)

      success(task, I18n.t('tasks.update.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('tasks.update.not_found'), { base: e.message })
    rescue ActiveRecord::RecordInvalid => e
      failure(I18n.t('tasks.update.failure'), e.record.errors)
    rescue Pundit::NotAuthorizedError
      failure(I18n.t('tasks.update.unauthorized'))
    end

  end
end