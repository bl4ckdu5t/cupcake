Rails.application.routes.draw do
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
  devise_for :users
  root 'welcome#index'
end
