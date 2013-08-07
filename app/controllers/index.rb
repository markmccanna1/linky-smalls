#==== GETS ===========================
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:short_url' do
  # redirect to appropriate "long" URL
end
#==== POSTS ==========================

post '/urls' do
  # create a new URL
end
