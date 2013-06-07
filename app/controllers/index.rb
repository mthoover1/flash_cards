get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :log_in
end

get '/logout' do
  session.clear
end 

get '/decks' do
  @decks = Deck.all
  @round = Round.create
  erb :decks
end

get '/rounds/:round_id/results' do
  @round = Round.find_by_id(params[:round_id])
  @guesses = Guess.find_all_by_round_id(params[:found_id])
  erb :round_results
end

get '/rounds/:deck_id/:round_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  guessed_card_ids = Guess.all.map(&:card_id)
  deck_card_ids = @deck.cards.all.map(&:id)
  remaining_cards = deck_card_ids - guessed_card_ids
  if remaining_cards.empty?
    redirect to '/rounds/' + @round.id.to_s + '/results'
  else
    @card = Card.find(remaining_cards.sample)
    erb :round_card
  end
end

post '/rounds/:deck_id/:round_id' do
  @guess = Guess.create(params[:form])
  redirect "/rounds/#{params[:deck_id]}/#{params[:round_id]}"
end

post '/login' do
  @user = User.authenticate(params[form])
  if @user
    session[:user_id] = @user.id
    redirect to '/decks'
  else
    redirect to '/'
  end
end

