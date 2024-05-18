class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    # need to amend this to accept a no_category option or something
    if params[:name].present?
      @tasks = @user.tasks.joins(:categories).where(categories: { name: params[:name] })
    else
      @tasks = @user.tasks
    end
  end
end
