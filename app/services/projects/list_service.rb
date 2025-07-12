module Projects
  class ListService < ApplicationService
    def initialize(user, params = {})
      @user = user
      @params = params
    end

    def call
      projects = policy_scope(@user)

      success(projects, I18n.t('projects.list.success'))
    end

    private

    def policy_scope(user)
      ProjectPolicy::Scope.new(user, Project).resolve
    end
  end
end
