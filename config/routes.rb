Rails.application.routes.draw do
  resources :connects do
    collection do
      post :confirm
    end
  end
end
