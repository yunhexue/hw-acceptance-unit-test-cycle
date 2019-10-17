Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/movies')
  root 'movies#index'
  match '/movies/:id/similar(.:format)', to: 'movies#similar_direc', as: 'movie_similar', via: :get
end
