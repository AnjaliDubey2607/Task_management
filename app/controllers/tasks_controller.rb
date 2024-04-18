# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authentication
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def edit; end

  # method to create user task
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if authorized_user?
      respond_to do |format|
        if update_task
          format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to_root_with_alert
    end
  end

  def destroy
    if current_user.id == @task.user_id
      @task.destroy!

      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, alert: 'You are not authorised to perform this operation.'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :user_id)
  end

  def authorized_user?
    current_user.id == params[:task][:user_id].to_i
  end

  def update_task
    @task.update(task_params)
  end

  def redirect_to_root_with_alert
    redirect_to root_path, alert: 'You are not authorised to perform this operation.'
  end
end
