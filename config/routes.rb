Rails.application.routes.draw do
    get '/home',     to: 'xmucane#home'

    get '/about',    to: 'xmucane#about'

    get '/glyphs',   to: 'xmucane#glyphs'

    root 'xmucane#home'
end
