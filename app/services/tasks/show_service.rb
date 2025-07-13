module Tasks
  class ShowService < ApplicationService
    def initialize(user, task_id)
      @user = user
      @task_id = task_id
    end

    def call
      task = Task.find(@task_id)

      success(task, I18n.t('tasks.show.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('tasks.show.not_found'), { base: e.message })
    rescue Pundit::NotAuthorizedError
      failure(I18n.t('tasks.show.unauthorized'))
    end

  end
end