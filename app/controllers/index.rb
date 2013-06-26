get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @new_url = Url.new(:long_url => params[:long_url])
  @new_url.save
  erb :index
end

get '/:short_url' do
  destination = Url.find_by_short_url(params[:short_url])
  destination.click_count += 1
  destination.save
  redirect destination.long_url
end
