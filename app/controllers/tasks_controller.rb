class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Task was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Task was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
