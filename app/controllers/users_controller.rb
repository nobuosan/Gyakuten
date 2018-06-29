class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @users = User.all
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
        format.html
        format.js
      else
        format.js {render :new}
      end
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
    @users = User.all
    user = User.find(params[:id])
    respond_to do |format|
      if user.destroy
        format.html
        format.js
      else
        format.html {render :index}
      end
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :program_id, :error_id)
  end
end
