class LikesController < ApplicationController
    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea: idea, user: current_user)
        
            if like.save
                flash[:notice] = "Question Liked"
            else
                flash[:alert] = like.errors.full_messages.join(', ')
               
            end
        
            redirect_to ideas_path
        
    end
    
    def destroy
        like = Like.find (params[:id])
        
            if like.destroy
                flash[:notice] = "Idea Unliked"
            else
                flash[:alert] = like.errors.full_messages.join(', ')
                
            end
        
          
            redirect_to ideas_path
    end
    
end
