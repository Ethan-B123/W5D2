class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def create
    # debugger
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :body)
  end
end
