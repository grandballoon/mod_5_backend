class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :logout]

  def create
    @user = User.find_by(username: user_login_params[:username])
    if @user && @user.authenticate(user_login_params[:password])
      puts "inside authentication"
      token = encode_token(user_id: @user.id)
      puts token
      @user.token = token
      @user.save
      render json: {user: UserSerializer.new(@user), jwt:token}, status: :accepted
    else
      puts "inside inauthentic"
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
