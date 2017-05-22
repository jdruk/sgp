Rails.application.routes.draw do

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
end
