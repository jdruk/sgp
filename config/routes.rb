Rails.application.routes.draw do

  # CRUMBOARD
  get '/task/take_task/:id', to: 'scrumboard#take_task', as: 'take_task'
  get '/task/get_out_task/:id', to: 'scrumboard#get_out_task', as: 'get_out_task'
  get '/task/send_task_to_test/:id', to: 'scrumboard#send_task_to_test', as: 'send_task_to_test'
  get '/task/redo_task/:id', to: 'scrumboard#redo_task', as: 'redo_task'
  get '/task/done_task/:id', to: 'scrumboard#done_task', as: 'done_task'

  # GAMIFICATION
  get '/gaming/achievements', to: 'gamification#achievements', as: 'achievements'
  get '/gaming/ranks', to: 'gamification#ranks', as: 'ranks'

  get '/project/scrumboard/:id', to: 'projects#scrumboard', as: 'scrumboard'

  get '/settings', to: 'settings#index', as: 'settings'

  #root to: redirect('/users/sign_in')
  root to: 'static#home_page'
  
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # routes for select and deselect projects
  get '/select/project/:id', to: 'projects#select', as: 'select_project'
  delete '/deselect/project', to: 'projects#deselect', as: 'deselect_project'

  # errors controller
  get '/wops/no_project_selected', to: 'errors#no_project_selected', as: 'no_project_selected'

  # normal_user 
  get '/projects/list', to: 'projects#user_project', as: 'user_project'

  #devise_for :users, :controllers  => {
  #           :registrations => 'users/registrations',
  #           :sessions => 'users/sessions'
  #         }

  resources :user_abilities
  resources :user_languages
  resources :task_requirements
  resources :tasks
  resources :user_story_acceptance_criterions
  resources :user_stories
  resources :sprints
  resources :releases
  
  resources :themes do
    get :autocomplete, :on => :collection
  end

  resources :projects
  resources :functions
  resources :abilities
  resources :locals
  resources :languages

  devise_for :users
    scope "/users" do
      resources :users
  end
  #devise_for :users
  #resources :users
  resources :function_user_projects

  # mount Notifications::Engine => "/notifications"
  resources :notifications
  delete '/clean', to: 'notifications#clean', as: 'clean_notifications'
end
