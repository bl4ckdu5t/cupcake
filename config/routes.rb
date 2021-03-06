Rails.application.routes.draw do
  get 'notifications' => 'accounts#notifications', as: :notifications
  patch 'profile-submit' => 'profile#update', as: :profile_update
  get 'profile-edit' => 'profile#edit', as: :profile_settings
  post 'calvary'     => 'accounts#calvary'
  get 'choose'       => 'accounts#choice', as: :type_choice
  resources :projects do
    collection do
      get 'stream-api'
      post 'submission'
      patch 'selecting' => 'projects#update_selecting'
      post 'selecting'
    end
  end
  get 'portfolio'        => 'welcome#portfolio', as: :portfolio
  get 'careers'          => 'welcome#jobs', as: :job_vacancy
  get 'about-us'         => 'welcome#about', as: :about_us
  get 'usage-guide'      => 'welcome#help', as: :help
  get 'terms-of-service' => 'welcome#terms', as: :tos
  get 'privacy-policy'   => 'welcome#privacy', as: :privacy
  scope path: "/pricing" do
    get 'logo'       => 'pricings#logo', as: :pricing_logo
    get 'stationery' => 'pricings#stationery', as: :pricing_stationery
    get 'banners'    => 'pricings#banners', as: :pricing_banner
    get 'brochure'   => 'pricings#brochure', as: :pricing_brochure
    get 'website'    => 'pricings#website', as: :pricing_website
    get 'corporate'  => 'pricings#corporate', as: :pricing_corporate
    get 'custom'     => 'pricings#custom', as: :pricing_custom
  end
  get 'designer-account' => 'accounts#designers', as: :designer
  get 'customer-account' => 'accounts#customers', as: :customer
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'welcome#index'
end
