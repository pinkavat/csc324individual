Rails.application.routes.draw do
    #get 'factoid_input/formpage'
    #post 'factoid_input/formpage', to: 'factoid_input#create'

    get '/home',        to: 'xmucane#home'

    get '/about',       to: 'xmucane#about'

    get '/glyphs',      to: 'xmucane#glyphs'
    get '/glyphs/:id',  to: 'xmucane#glyphs'

    root 'xmucane#home'

end
