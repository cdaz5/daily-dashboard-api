class Api::V1::UsersController < ApplicationController

  def create
    puts 'in create'
    if !User.find_by(email: params[:email])
      stringOutlets = params[:outlets].join(' ')
      user = User.new(name: params[:name], email: params[:email], password: params[:password], outlets: stringOutlets)
      if user.valid?
        puts 'in valid'
        user.save
        created_jwt = issue_token({
          id: user.id,
          email: user.email
          })
        render json: {id: user.id, email: user.email, name: user.name, outlets: user.outlets.split(' '), jwt: created_jwt}
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: ["User Email Already Exists"]}
    end
  end

  def edit
  end

 private
  def user_params
    params.permit(:name, :email, :outlets, :password)
  end

end
