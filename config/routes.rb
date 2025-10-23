Rails.application.routes.draw do
  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons
 
  # The next instruction creates 7 resourceful routes.
  resources :courses
  
  # Among them is the route needed for lesson-07 QUESTION 2 which is:
  # get "courses/:id, to courses#show"
  # It also creates the files for the controller and the view, so the only thing left to do is 
  # to modify the view in order to display the information required by lesson-07 QUESTION 2 
  
  resources :coding_classes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Routes for lesson-06
  get "/trimesters", to: "trimesters#index" 
  get "/trimesters/:id", to: "trimesters#show"

  # This is the route for lesson-07 QUESTION 1
  get "/dashboard", to: "admin_dashboard#index" 

  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
