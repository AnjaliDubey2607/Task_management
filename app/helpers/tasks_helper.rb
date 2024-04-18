# frozen_string_literal: true

module TasksHelper
  def check_action(resource = nil)
    if resource
      resource.persisted? ? 'Update' : 'Add'
    else
      params[:action] == 'edit' ? 'Update' : 'Add'
    end
  end
end
