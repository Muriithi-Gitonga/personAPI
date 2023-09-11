Rails.application.routes.draw do
  
  get "api/:user_id", to: "person#show"
  post "api", to: "person#create"
  put "api/:user_id", to: "person#update"
  delete "api/:user_id", to: "person#destroy"
end
