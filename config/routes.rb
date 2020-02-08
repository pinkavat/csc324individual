Rails.application.routes.draw do
    root 'hw3#home'

    get '/home',    to: 'hw3#home'

    get '/about',   to: 'hw3#about'

    get '/faq',     to: 'hw3#faq'
end
