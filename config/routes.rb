Fed::Application.routes.draw do

  devise_for :users
  match "logout", :to => "devise_session#destroy"

  resources :federations do
    resources :schools
  end

  resources :schools do
    resources :people
  end
  resources :people do
    resources :observations
    resources :general_evaluations
  end



  root :to => "main#index"

  match "public", :to => "main#public"

  match "/:name", :controller => 'unames', :action => 'show'
end
