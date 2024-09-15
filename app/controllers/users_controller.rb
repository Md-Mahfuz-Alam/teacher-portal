class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[ show ]

  def new
    @user  = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to new_session_path, flash: { notice: 'Sign up successfully' }
    else  
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  def show
    @user = @current_user
    @students = Student.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end

end
