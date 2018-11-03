class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :logout]

  def create
    @user = User.find_by(username: user_login_params[:username])
    puts "user is #{@user}"
    puts "Is the user authenticated? #{@user.authenticate(user_login_params[:password])}"
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token(user_id: @user.id)
      puts "token is #{token}"
      @user.token = token
      @user.save
      render json: {user: UserSerializer.new(@user), jwt:token}, status: :accepted
    else
      puts "user was invalid"
      render json: {message: 'invalid username or password'}, status: :unauthorized
    end
  end

  def logout
    @user = User.find_by(username: user_login_params[:username])
    @user.token = ''
    render json: {user: UserSerializer.new(@user)}, status: :accepted
  end



  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end



end
