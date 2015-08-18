class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    # go to a form where the user can enter the info of the new task
    @task = Task.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
