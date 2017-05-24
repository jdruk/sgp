class ScrumboardController < ApplicationController
  def take_task
    task = Task.find(params[:id])
    user_task = UsersTask.where(user_id: current_user.id, task_id: task.id)
    
    if user_task.empty?
      UsersTask.create(user_id: current_user.id, task_id: task.id)
    end
    
    if task.status == 1
      task.update(status: 2)
    end

    redirect_to scrumboard_path(task.user_story.project.id)
  end

  def get_out_task
    task = Task.find(params[:id])
    user_task = UsersTask.where(user_id: current_user.id, task_id: task.id)

    unless user_task.empty?
      UsersTask.where(user_id: current_user.id, task_id: task.id).destroy_all
    end

    if task.users.count == 0
      task.update(status: 1)
    end

    redirect_to scrumboard_path(task.user_story.project.id)
  end

  def send_task_to_test
    task = Task.find(params[:id])
    task.update(status: 3)

    redirect_to scrumboard_path(task.user_story.project.id)
  end

  def redo_task
    task = Task.find(params[:id])
    task.update(status: 2)

    redirect_to scrumboard_path(task.user_story.project.id)
  end

  def done_task
    task = Task.find(params[:id])
    task.update(status: 4)

    redirect_to scrumboard_path(task.user_story.project.id)
  end
end
