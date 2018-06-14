class PostsController < ApplicationController
    def index
        @course = Course.find(params[:course_id])
        @posts = @course.posts
    end

    def new
        @course = Course.find(params[:course_id])
        @post = Post.new(course_id: params[:course_id], user_id: current_user.id)
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to course_posts_path(@course)
        else
            redirect_to new_course_post_path
        end
    end

    def edit
        @course = Course.find(params[:course_id])
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to course_posts_path(@course)
        else
            redirect_to edit_course_post_path
        end
    end

    private

    def posts_controller
        params.require(:post).permit(:type, :content, :course_id, :user_id)
    end

end
