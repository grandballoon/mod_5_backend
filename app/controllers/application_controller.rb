class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, ENV["JWT_SECRET"])
  end

  # ENV["jwt_secret"]

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
    token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV["jwt_secret"], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      puts "token decoded"
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
      puts @user
      if @user.token == auth_header.split(' ')[1]
        @user
      else
        nil
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: "please log in"}, status: :unauthorized unless logged_in?
  end
end
