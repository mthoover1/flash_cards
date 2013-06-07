get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :log_in
end

post '/login' do
  # @user = User.authenticate(params[form])
  # if @user
  #   redirect to '/decks'
  # else
  #   redirect to '/'
  # end
end

get '/decks' do
  @decks = Deck.all
  erb :decks
end

get '/decks/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @round = Round.create
  @round.deck = @deck
  erb :round
end

get '/rounds/:round_id' do
  @round = Round.find_by_id(params[:round_id])
  @guesses = Guess.find_all_by_round_id(params[:found_id])
  erb :round_results
end

