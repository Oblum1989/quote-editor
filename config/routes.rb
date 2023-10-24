Rails.application.routes.draw do
  get 'line_item_dates/new'
  get 'line_item_dates/create'
  root to: "pages#home"

  devise_for :users

  resources :quotes do
    resources :line_item_dates, except: [:index, :show]
  end
end
