module Api
  module V1
    class ProjectsController < BaseController
      before_action :set_project, only: %i[show update destroy]
      before_action :authorize_project, only: %i[show update destroy]

      def index
        result = Projects::ListService.call(current_user, params)

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def show
        render_success({ project: @project }, I18n.t('projects.show.success'))
      end

      def create
        result = Projects::CreateService.call(current_user, project_params)

        if result.success?
          render_success(result.data, result.message, :created)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def update
        result = Projects::UpdateService.call(current_user, params[:id], project_params)

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      def destroy
        result = Projects::DeleteService.call(current_user, params[:id])

        if result.success?
          render_success(result.data, result.message)
        else
          render_error(result.message, :unprocessable_entity, result.errors)
        end
      end

      private

      def set_project
        @project = Project.find(params[:id])
      end

      def authorize_project
        authorize @project
      end

      def project_params
        params.expect(project: %i[name color description archived])
      end
    end
  end
end
