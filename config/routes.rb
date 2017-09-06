Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post '/login', to: 'auth#create'
      post '/me', to: 'auth#show'
      post '/signup', to: 'users#create'
      get '/scrape', to: 'images#scrape'
      get '/images', to: 'images#index'
      get '/api_sources', to: 'images#fetch_sources_from_api'
      get '/sources', to: 'images#sources'
    end
  end
end
