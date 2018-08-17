class PostsController < ApplicationController
    before_action :require_login

    def index
        @course = Course.find(params[:course_id])
        @posts = @course.posts.order(updated_at: :desc)
        if params[:post_type_filter] && !params[:post_type_filter].blank?
            @posts = @course.posts.filter(params[:post_type_filter]).order(updated_at: :desc)
        else
            @posts = @course.posts.order(updated_at: :desc)
        end
    end

    def new
        @course = Course.find(params[:course_id])
        @post = Post.new(course_id: params[:course_id], user_id: current_user.id)
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to course_posts_path(@post.course)
        else
            @course = @post.course
            render 'new'
        end
    end

    def show
        @course = Course.find(params[:course_id])
        @post = Post.find_by(id: params[:id])
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @posts, include: ['user', 'course', 'course.university'] }
        end
    end

    def edit
        @course = Course.find(params[:course_id])
        @post = Post.find_by(id: params[:id])
        validate_poster(@post)
    end

    def update
        @post = Post.find_by(id: params[:id])
        validate_poster(@post)
        if @post.update(post_params)
            redirect_to course_posts_path(@post.course)
        else
            @course = @post.course
            render 'edit'
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        validate_poster(@post)
        @post.destroy
        redirect_to course_posts_path(@post.course)
    end

    private

    def post_params
        params.require(:post).permit(:post_type, :content, :course_id, :user_id)
    end

end
