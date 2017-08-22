class Api::V1::UsersController < ApplicationController

  def create
    puts 'in create'
    if !User.find_by(email: params[:email])

      user = User.new(user_params)
      if user.valid?
        puts 'in valid'
        user.save
        created_jwt = issue_token({
          id: user.id,
          email: user.email
          })
        render json: {id: user.id, email: user.email, name: user.name, baseball: user.baseball, football: user.football, basketball: user.basketball, outlets: user.outlets, birthday: user.birthday, jwt: created_jwt}
      else
        render json: {error: user.errors.full_messages}
      end
    else
      render json: {error: ["User Email Already Exists"]}
    end
  end

  def edit
  end

 private
  def user_params
    params.permit(:name, :email, :birthday, :outlets, :football, :baseball, :basketball, :password)
  end

end
