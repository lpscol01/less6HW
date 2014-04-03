class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.user = current_user
		if @topic.save
			flash[:notice] = "Your topic has been saved."
			redirect_to topic_path(@topic)
		else
			flash[:alert] = "Your topic was unable to be saved."
			redirect_to :back
		end
	end

	def edit
		@topic = Topic.find(params[:id])

	end

	def update
		
	end

	def destroy
		@topic = Topic.find(params[:id])
		if @topic.destroy
			flash[:notice] = "You topic has been updated!"
			redirect_to user_topic_path(@topic.user)
		else
			flash[:alert] = "There was an issue updating your topic."
			redirect_to :back
		end
	end

	private

	def topic_params
		params.require(:topic).permit(:subject)
	end
end