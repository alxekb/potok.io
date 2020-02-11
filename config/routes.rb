Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: :json } do
    get '/rates', to: 'rates#get_rates'
    post '/update', to: 'rates#update_rates'

    match '*path', to: 'base#undefined_route', via: [:get, :post]
  end
end
