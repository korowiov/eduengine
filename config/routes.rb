Rails.application.routes.draw do
  mount Api::Engine, at: '/api'
  mount Admin::Engine, at: '/admin'
end
