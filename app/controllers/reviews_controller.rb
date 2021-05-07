class ReviewsController < ApplicationController

    before_action :authenticate_user!, except:[:index, :show]
    before_action :find_idea, only:[:create, :destroy]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def create
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user

        if @review.save
            redirect_to idea_path(@idea, @review), notice: 'Review Created'
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render '/ideas/show'
        end
    end

    def destroy
        @review = Review.find params[:id]
        if can? :crud, @review
            @review.destroy
            redirect_to idea_path(@idea, @review), notice: 'Review Deleted'
        else
            redirect_to home_path, alert: 'Not Authorized!'
        end
    end


    private

    def find_idea
        @idea = Idea.find params[:idea_id]
    end

    def review_params
        params.require(:review).permit(:body, :rating)
    end

    def authorize_user!
        redirect_to home_path, alert: 'Not Authorized' unless can? :crud, @idea
    end

end
