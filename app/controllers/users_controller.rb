class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update, :show]


  def index
    @profiles = Profile.order(:created_at).page params[:page]
  end

  def search_results
    @search = Profile.search do
      with(:country, params[:country]) if params[:country].present?
      with(:education, params[:education]) if params[:education].present?
      with(:nationality, params[:nationality]) if params[:nationality].present?
      with(:city, params[:city]) if params[:city].present?
      with(:gender, params[:gender]) if params[:gender].present?
      facet(:age)
      with(:age).greater_than params[:low_age] if params[:low_age].present?
      with(:age).less_than params[:high_age] if params[:high_age].present?
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 2
    end
    @profiles = @search.results
    render :index
  end

  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Successfully created your user profile!"
      redirect_to new_user_photo_path(@user)
    else
      render :new
    end
  end

  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
