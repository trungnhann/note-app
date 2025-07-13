module Api
  module V1
    class TasksController < BaseController
      before_action :set_task, only: %i[show update destroy toggle_status]
      before_action :authorize_task, only: %i[show update destroy toggle_status]

      def index
        result = Tasks::ListService.call(current_user, params)

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def show
        render_success({ task: @task }, I18n.t('tasks.show.success'))
      end

      def create
        result = Tasks::CreateService.call(current_user, task_params)

        if result.success?
          render_success(result.data, result.message, :created)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def update
        result = Tasks::UpdateService.call(current_user, params[:id], task_params)

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def destroy
        result = Tasks::DeleteService.call(current_user, params[:id])

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def toggle_status
        result = Tasks::ToggleStatusService.call(current_user, params[:id])

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def authorize_task
        authorize @task
      end

      def task_params
        params.require(:task).permit(:title, :description, :due_date, :priority, :project_id, :status)
      end
    end
  end
end