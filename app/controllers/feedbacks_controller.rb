class FeedbacksController < ApplicationController
    before_action :set_user
    def index
      @feedbacks = @user.feedbacks.all
    end
  
    def show
      feedbacks = @user.feedbacks.find(params[:id])
    end
  
    def new
      feedbacks = @user.feedbacks.new
    end
  
    def edit
      feedbacks = @user.feedbacks.find(params[:id])
    end
  
    def create
      feedbacks = @user.feedbacks.create(feedback_params)
      if feedbacks.save
      redirect_to user_feedbacks_path(@user)
      else 
        render :new
      end
    end
  
    def update
      feedbacks = @user.feedbacks.find(params[:id])
      if feedbacks.update(feedback_params)
        redirect_to user_feedbacks_path(@user)
      else
        redirect_to  edit_user_feedback_path(@user)
      end
    end
  
    private
  
    def feedback_params
      params.require(:feedback).permit(:title, :grade, :user_id)
    end
  
    def set_classroom
      @user = User.find_by(id: params[:user_id])
    end
  
end
