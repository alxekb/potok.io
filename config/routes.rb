Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: :json } do
    namespace :rates do
      get '/', to: 'rates#get_rates'
      get '/currency', to: 'rates#currency_rate'
      post '/', to: 'rates#update_rates'
    end

    match '*path', to: 'base#undefined_route', via: [:get, :post]
  end
end
