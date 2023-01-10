Rails.application.routes.draw do
  # devise_for :employees #, :skip => [:sessions] #, 
  # controllers: {registrations: 'employees/registrations', sessions: 'employees/sessions'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # root routes
  root "pages#index"

  # devise routes
  devise_for :employees, module: "employees"

  # get routes
  get '/employee', to: "pages#dashboard", :as => :employee_root
  get '/employee/list', to: "pages#show", as: 'employees_list'

  get '/employee/division/new', to: "divisions#new", as: 'division_new'
  get '/employee/division/index', to: "divisions#index", as: 'division_index'
  get '/employee/division/edit/:id', to: 'divisions#edit', as: 'division_edit'
  get '/employee/division/show/:id', to: "divisions#show", as: 'division' 

  get '/employee/designation/new', to: "designations#new", as: 'designation_new'
  get '/employee/designation/index', to: "designations#index", as: 'designation_index'
  get '/employee/designation/edit/:id', to: 'designations#edit', as: 'designation_edit'
  get '/employee/designation/show/:id', to: "designations#show", as: 'designation'

  get '/employee/project/new', to: "projects#new", as: 'project_new'
  get '/employee/project/index', to: "projects#index", as: 'project_index'
  get '/employee/project/edit/:id', to: "projects#edit", as: 'project_edit'
  get '/employee/project/show/:id', to: "projects#show", as: 'project' 

  # post routes
  post 'designations', to: 'designations#create'
  patch '/designations/:id', to: 'designations#update', as: 'designation_update'
  put '/designations/:id', to: 'designations#update'

  post 'divisions', to: 'divisions#create'
  patch  '/divisions/:id', to: 'divisions#update', as: 'division_update'
  put   '/divisions/:id', to: 'divisions#update'

  post 'projects', to: 'projects#create'
  patch  '/projects/:id', to: 'projects#update', as: 'project_update'
  put   '/projects/:id', to: 'projects#update'
  # Defines the root path route ("/")
  # root "articles#index"
end
