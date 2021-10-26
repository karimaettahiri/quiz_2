class IdeasController < ApplicationController
    before_action :find_idea, only: [:edit, :update, :show, :destroy]
    before_action :authenticate_user! 
    before_action :authorize_user!, only: [:update, :destroy]

    def new
        @idea = Idea.new
    end
    def create
        @idea = Idea.new idea_params
        @idea.user = current_user
        if @idea.save
          redirect_to ideas_path(@idea)
        else
          render :new
        end
    end
    def index
        @ideas = Idea.all
        
    end
    def show

        @reviews = @idea.reviews
        @review = Review.new
       

    end

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end
    def edit

    end

    def update
        if @idea.update idea_params
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end


    private
    

    def find_idea
        @idea =  Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
    def authorize_user!
        redirect_to root_path, alert: "Not Authorized!" unless can?(:crud, @idea)
    end
end
