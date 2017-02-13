Rails.application.routes.draw do

  post '/api/v1/commits', to: 'commits#create'

end
