Rails.application.routes.draw do
  root 'rank#rank'
  post 'refresh' => 'rank#refresh'
end
