Rails.application.routes.draw do
  get 'designer-account' => 'accounts#designers', as: :designer
  get 'customer-account' => 'accounts#customers', as: :customer
  devise_for :users
  root 'welcome#index'
end
