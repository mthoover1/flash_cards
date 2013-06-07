get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :log_in
end

post '/login' do
  @user = User.authenticate(params[form])
  if @user
    redirect to '/decks'
  else
    erb :index
  end
end

get '/decks' do
  @decks = Decks.all
  erb :decks
end

