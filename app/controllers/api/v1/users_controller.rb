class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def profile
    render json: {user: UserSerializer.new(current_user)}, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def subscribe
    @fact = Fact.find_by(id: subscription_params[:fact_id])
    @user = User.find_by(id: subscription_params[:user_id])
    if !@user.facts.include?(@fact)
      @user.facts << @fact
      TwilioTextMessenger.new(@fact.description).delay.call
    end
    if @user.save
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: 'could not complete request'}, status: :not_acceptable
    end
  end

  def unsubscribe
    @fact= Fact.find_by(id: subscription_params[:fact_id])
    @user = User.find_by(id: subscription_params[:user_id])
    @user.facts.destroy(@fact)
    @user.save
    render json: { user: UserSerializer.new(@user)}, status: :accepted
    # if

    # else
    #   render json: { error: 'could not complete request'}, status: :not_acceptable
    # end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :bio, :facts, :email, :phone_number)
  end

  def subscription_params
    params.permit(:fact_id, :user_id)
  end

end
