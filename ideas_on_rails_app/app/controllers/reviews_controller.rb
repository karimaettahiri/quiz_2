class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new(params.require(:review).permit(:body))
        @review.idea = @idea
        @review.user = current_user
        if @review.save
           
            redirect_to idea_path(@idea.id)
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render '/ideas/show'
        end

    end
    def destroy
        @idea = Idea.find params[:idea_id]
        @review = Review.find params[:id]
        if can?(:crud, @review)
            if @review.destroy
                flash[:success] = "Deleted"
                redirect_to idea_path(@idea)
            else
                redirect_to root_path, alert: "can't delete"
            end
        else
            
            redirect_to root_path, alert: "Not Authorized!"
        end

    end
end
