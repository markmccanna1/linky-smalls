require 'uri'
#==== GETS ===========================
get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  # FUTURE HELPER !!!!!
  # title_of_link = 
  erb :index
end

get '/:short_url' do
  # redirect to appropriate "long" URL
  url = Url.where(short_url: params[:short_url]).first
  long_url = url.long_url
  url.increment_count
  #update counter
  redirect "#{long_url}"
end

#==== POSTS ==========================

post '/urls' do
  # create a new URL
  puts params[:url].class
  url = Url.new(long_url: params[:url])
  if url.valid?
    url.save
  else
    redirect to'/?failed=true'
  end
  # url.save
  redirect "/"
end
