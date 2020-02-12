Rails.application.routes.draw do
    get '/home',     to: 'xmucane#home'

    get '/about',    to: 'xmucane#about'

    get '/glyphs',   to: 'xmucane#glyphs'


    get 'hw3/home',    to: 'hw3#home'

    get 'hw3/about',   to: 'hw3#about'

    get 'hw3/faq',     to: 'hw3#faq'

    root 'xmucane#home'
end
