Hestia::Application.routes.draw do
  get "home/index"
  get "home/show"
  get "home/search"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

   root 'accounts#index'

end
