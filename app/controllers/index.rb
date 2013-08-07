#==== GETS ===========================
get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

get '/:short_url' do
  # redirect to appropriate "long" URL
end

#==== POSTS ==========================

post '/urls' do
  # create a new URL
  Url.create(params[:long_url])
  redirect "/"
end
