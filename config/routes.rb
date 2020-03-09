Rails.application.routes.draw do
    get '/home',        to: 'xmucane#home'
    get '/home/(:date)',to: 'xmucane#home', constraints: {:date => /-?\d{4}-\d{2}-\d{2}/ }, as: 'home_date'

    get '/about',       to: 'xmucane#about'

    get '/glyphs',      to: 'xmucane#glyphs'
    get '/glyphs/:id',  to: 'xmucane#glyphs'

    root 'xmucane#home'

end
