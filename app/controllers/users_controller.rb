class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.set_confirmation_token
        UserMailer.registration_confirmation(@user).deliver_now
        format.html { redirect_to login_url, notice: "Your account need to be confirmed by email letter, that we sent to you, #{@user.name}." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User #{@user.name} profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def confirm_email
    user = User.find_by_confirm_token(params[:confirm_token])
    if user
      user.validate_email
      user.save
      redirect_to store_index_url, notice: 'Your account was successfully confirmed'
    else
      redirect_to login_url
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :confirm_token, :email)
    end
end
