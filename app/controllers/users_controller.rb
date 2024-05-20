class UsersController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @user = User.find(params[:id])

  #   # need to amend this to accept a no_category option or something
  #   if params[:name].present?
  #     @tasks = @user.tasks.joins(:categories).where(categories: { name: params[:name] })
  #   else
  #     @tasks = @user.tasks
  #   end
  # end

  def show
    @user = User.find(params[:id])
  
    if params[:name].present?
      if params[:name] == 'No Categories'
        @tasks = @user.tasks.includes(:task_categories).where(task_categories: { category_id: nil })
      else
        category = Category.find_by(name: params[:name])
        @tasks = @user.tasks.joins(:task_categories).where(task_categories: { category_id: category.id })
      end
    else
      @tasks = @user.tasks
    end
  end

end
