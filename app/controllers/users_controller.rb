class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        redirect_to root_url unless @user == current_user
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @user, include: ['posts', 'posts.course', 'posts.course.university'] }
        end
        #@posts = @user.posts.order(updated_at: :desc)
    end

    def most_posts
        @user = User.most_posts[0]
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
