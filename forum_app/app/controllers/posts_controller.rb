class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		flash[:notice] = "Here are all the user posts."
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.new
	end

	def create
		@post = Post.new(post_params)
		@post.topic_id = params[:topic_id]
		@post.user = current_user
		if @post.save
			flash[:notice] = "Your post has been saved."
			redirect_to topic_path(@post.topic)
		else
			flash[:alert] = "Your post was unable to be saved."
			redirect_to topic_path(@post.topic)
		end
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	## do not want to give others ability to edit/delete orig post
	#def edit
	#	@post = Post.find(params[:id])

	#end

	#def update
	#	@post = Post.find(params[:id])
	#	if @post && @post.update_attributes(params[:post])
	#		flash[:notice] = "You post has been updated!"
	#	else
	#		flash[:alert] = "There was an issue updating your post."
	#	end
	#	redirect_to user_post_path(@post.user, @post)
	#end

	#def destroy
	#	@post = Post.find(params[:id])
	#	if @post.destroy
	#		flash[:notice] = "You post has been updated!"
	#		redirect_to user_post_path(@post.user)
	#	else
	#		flash[:alert] = "There was an issue updating your post."
	#		redirect_to :back
	#	end
	#end

end