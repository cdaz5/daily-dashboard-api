class Api::V1::AuthController < ApplicationController

  def show
    user = User.find_by(email: params[:email])
      if user
        render json: { user: user }
      else
        render json: { user: false }
      end
  end

  def create
     user = User.find_by(email: params[:email])
    #  byebug
     # if the is, make sure that they have the correct password
     if user.present? && user.authenticate(params[:password])
       # if they do, render back a json response of the user info
       # issue token
       created_jwt = issue_token({
         id: user.id,
         email: user.email
         })
       render json: {id: user.id, email: user.email, name: user.name, outlets: user.outlets.split(' '), jwt: created_jwt}
     else
       # otherwise, render back some error response
       render json: { error: ['Invaid Email or Password'] }, status: 422
     end
  end

end
