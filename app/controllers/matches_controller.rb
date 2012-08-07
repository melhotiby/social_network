class MatchesController < ApplicationController

  def new
    @match = Match.new
  end

  def create
  end

  private

    def the_user
      @user = User.find(params[:user_id])
    end
end
