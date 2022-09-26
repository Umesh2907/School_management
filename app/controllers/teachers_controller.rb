class TeachersController < ApplicationController
  def index
    @teachers = User.where(role: "teacher")
  end

  def show
  end

  def new
  end

  def edit
  end
end
