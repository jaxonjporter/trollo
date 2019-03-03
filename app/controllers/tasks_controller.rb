class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_complete]
  before_action :set_list
  
    def index
      @tasks = @lists.tasks
    end
  
    def show
    end
  
    def new
      @task = @list.tasks.new
    end
  
    def create
      @task = @list.tasks.new(task_params)
  
      if @task.save
        # redirect_to [@sub, @topic]
        redirect_to list_tasks_path(@list, @task)
      else
        render :new
      end
    end
    
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to [@list, @task]
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to list_tasks_path(@list)
    end
  
    private
  
    def set_list
      @list = List.find(params[:list_id])
    end
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :done)
    end
end
