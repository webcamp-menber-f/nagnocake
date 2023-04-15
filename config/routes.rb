Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions" 
  }
  
  scope module: :public do
   root :to => 'homes#top'  
   get 'about' => 'homes#top'
   get 'customers/withdraw' => 'customers#withdraw'
   patch 'customers/unsubscribe' => 'customers#unsubscribe'
   delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   resources :items, only: [:index, :show]
   resources :customers, only: [:show, :edit, :update]
   resources :cart_items, only: [:index, :update, :destroy, :create]
   resources :orders, only: [:new, :create, :index, :show]
   resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namespace :admin do
    get 'admin' => 'admin/homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
