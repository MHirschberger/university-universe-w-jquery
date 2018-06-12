class SessionsController < ApplicationController
    def new
    end
  
    def create
      if !params[:password].nil?
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = "Email and/or Password Incorrect. Please try again."
          redirect_to '/signin'
        end
      else
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
        
        session[:user_id] = @user.id
        render 'users/show'
      end

    end
  
    def destroy
      session.delete :user_id
      redirect_to root_url
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end
