Espace::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root "pages#wall"
  resources :pages do
    collection do
      get :wall
    end

    member do
      get :activate
      get :publish
      get :unpublish
    end
    resources :comments
  end
end
