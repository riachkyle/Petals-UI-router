Petals::Application.routes.draw do

  root "dynamic#index"
  

  scope '/api' do
    resources :accounts, defaults: {format: :json}
    resources :posts, defaults: { format: :json }
  end

end