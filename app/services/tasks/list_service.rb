module Tasks
  class ListService < ApplicationService
    def initialize(user, params = {})
      @user = user
      @params = params
      @project_id = params[:project_id]
    end

    def call
      if @project_id.present?
        project = Project.find(@project_id)
        tasks = project.tasks
      else
        tasks = policy_scope(@user)
      end

      tasks = apply_filters(tasks)

      success(tasks, I18n.t('tasks.list.success'))
    rescue ActiveRecord::RecordNotFound => e
      failure(I18n.t('tasks.list.project_not_found'), { base: e.message })
    rescue Pundit::NotAuthorizedError
      failure(I18n.t('tasks.list.unauthorized'))
    end

    private

    def policy_scope(user)
      TaskPolicy::Scope.new(user, Task).resolve
    end

    def apply_filters(tasks)
      tasks = tasks.where(status: @params[:status]) if @params[:status].present?
      tasks = tasks.where(priority: @params[:priority]) if @params[:priority].present?
      tasks = tasks.where(due_date: @params[:due_date]) if @params[:due_date].present?
      tasks = tasks.today if @params[:today].present? && @params[:today] == 'true'
      tasks = tasks.overdue if @params[:overdue].present? && @params[:overdue] == 'true'
      tasks
    end
  end
end