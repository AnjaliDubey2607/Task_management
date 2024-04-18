# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authentication
    return if current_user.present?

    redirect_to new_user_session_path
  end
end
