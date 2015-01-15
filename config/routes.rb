Rails.application.routes.draw do
  root 'rank#rank'
  post 'refresh' => 'rank#refresh'
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy"
end
