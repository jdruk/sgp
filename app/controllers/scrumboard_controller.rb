class ScrumboardController < ApplicationController
  def take_task
    task = Task.find(params[:id])
    # current_user
    if UsersTask.where(user_id: current_user.id, task_id: task.id).count == 0
      task.update(status: 2) if task.status == 1
      UsersTask.create(user_id: current_user.id, task_id: task.id)
    end

    redirect_to scrumboard_path(task.user_story.project.id)
  end
end
