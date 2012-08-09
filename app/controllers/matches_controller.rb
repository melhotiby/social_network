class MatchesController < ApplicationController
  before_filter :the_user, :only => [:new, :create]

  def new
    @match = Match.new
  end

  def create
    @match = @user.build_match(params[:match])
    if @match.save
      redirect_to @user
    end
  end

  private

    def the_user
      @user = User.find(params[:user_id])
    end
end
