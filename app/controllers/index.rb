get '/' do
  if session[:user]
    redirect '/user'
  else
    erb :index
  end
end

# DECKS, ROUNDS AND GAMEPLAY ROUTES

get '/decks' do
  @decks = Deck.all
  @round = Round.create
  @round.update_attribute(:user_id, current_user.id)
  erb :decks
end

get '/rounds/:round_id/results' do
  @round = Round.find_by_id(params[:round_id])
  @guesses = Guess.find_all_by_round_id(params[:round_id])
  erb :round_results
end

get '/rounds/:deck_id/:round_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  @round.update_attribute(:deck_id, @deck.id)
  guessed_card_ids = Guess.all.map(&:card_id)
  deck_card_ids = @deck.cards.all.map(&:id)
  remaining_cards = deck_card_ids - guessed_card_ids
  if remaining_cards.empty?
    redirect to "/rounds/#{@round.id}/results"
  else
    @card = Card.find(remaining_cards.sample)
    erb :round_card
  end
end

post '/rounds/:deck_id/:round_id' do
  @guess = Guess.create(params[:form])
  redirect "/rounds/#{params[:deck_id]}/#{params[:round_id]}"
end



# USER PAGE AND LOGIN / LOGOUT ROUTES

post '/login' do
  @user = User.authenticate(params[:form][:email], params[:form][:email])
  if @user
    session[:user] = @user.id
    redirect to '/decks'
  else
    redirect to '/'
  end
end

post '/signup' do
  if @user = User.create(params[:user])
    session[:user] = @user.id
    redirect '/decks'
  else
    @errors = @user.errors
    redirect '/'
  end
end

get '/user' do
  @user = current_user
  @rounds = Round.find_all_by_user_id(@user.id)
  redirect to '/login' unless @user
  erb :user
end

get '/logout' do
  session.clear
  redirect '/'
end
