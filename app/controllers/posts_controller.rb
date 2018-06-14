class PostsController < ApplicationController
    def index
        @course = Course.find(params[:course_id])
        @posts = @course.posts
    end

    def new
        @university = University.find(params[:university_id])
        @post = Post.new(course_id: params[:course_id])
    end


end
