Fed::Application.routes.draw do

  devise_for :users

  resources :federations do
    resources :schools do
      resources :people
    end
    resources :people
  end
  resources :people

  root :to => "main#index"

  match "public", :to => "main#public"

  match "/:name", :controller => 'unames', :action => 'show'
end
