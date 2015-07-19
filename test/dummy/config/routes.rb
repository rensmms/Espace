Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Espace::Engine => "/espace"

  root "application#choose_user"
  get :choose_user, controller: :application
  post :init_user, controller: :application

end
