class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    # need to build category on the task_category build
    @task.task_categories.build.build_category
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # need to permit both task_categories and categories' attributes since they're nested and I'm wanting to post info to the category model which is linked to the task_category (and it's nested inside it because task_category gets built first?)
  # this is all still a bit confusing to me but okay.
  def task_params
    params.require(:task).permit(:title, :description, task_categories_attributes: [:id, category_attributes: [:id, :name]])
  end
end
