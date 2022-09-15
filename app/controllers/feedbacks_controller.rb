class FeedbacksController < ApplicationController
    before_action :set_user
    def index
      @feedbacks = @user.feedbacks.all
    end
  
    def show
      @feedback = @user.feedbacks.find(params[:id])
    end
  
    def new
      @feedback = @user.feedbacks.new
    end
  
    def edit
      @feedback = @user.feedbacks.find(params[:id])
    end
  
    def create
      @feedback = @user.feedbacks.create(feedback_params)
      if @feedback.save
      redirect_to user_feedbacks_path(@user)
      else 
        render :new
      end
    end
  
    def update
      @feedback = @user.feedbacks.find(params[:id])
      if @feedback.update(feedback_params)
        redirect_to user_feedbacks_path(@user)
      else
        redirect_to  edit_user_feedback_path(@user)
      end
    end
  
    private
  
    def feedback_params
      params.require(:feedback).permit(:title, :grade, :feedback, :user_id)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
end
