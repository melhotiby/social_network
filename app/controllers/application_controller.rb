class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  after_filter :user_activity

  private

    def user_activity
      current_user.try :touch
    end
end
