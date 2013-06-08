capitols_list = [ ["Alabama", "Montgomery"],
                  ["Alaska", "Juneau"],
                  ["Arizona", "Phoenix"],
                  ["Arkansas", "Little Rock"],
                  ["California", "Sacramento"],
                  ["Colorado", "Denver"],
                  ["Connecticut", "Hartford"],
                  ["Delaware", "Dover"],
                  ["Florida", "Tallahassee"],
                  ["Georgia", "Atlanta"],
                  ["Hawaii", "Honolulu"],
                  ["Idaho", "Boise"],
                  ["Illinois", "Springfield"],
                  ["Indiana", "Indianapolis"],
                  ["Iowa", "Des Moines"],
                  ["Kansas", "Topeka"],
                  ["Kentucky", "Frankfort"],
                  ["Louisiana", "Baton Rouge"],
                  ["Maine", "Augusta"],
                  ["Maryland", "Annapolis"],
                  ["Massachusetts", "Boston"],
                  ["Michigan", "Lansing"],
                  ["Minnesota", "St Paul"],
                  ["Mississippi", "Jackson"],
                  ["Missouri", "Jefferson City"],
                  ["Montana", "Helena"],
                  ["Nebraska", "Lincoln"],
                  ["Nevada", "Carson City"],
                  ["New Hampshire", "Concord"],
                  ["New Jersey", "Trenton"],
                  ["New Mexico", "Santa Fe"],
                  ["New York", "Albany"],
                  ["North Carolina", "Raleigh"],
                  ["North Dakota", "Bismark"],
                  ["Ohio", "Columbus"],
                  ["Oklahoma", "Oklahoma City"],
                  ["Oregon", "Salem"],
                  ["Pennsylvania", "Harrisburg"],
                  ["Rhode Island", "Providence"],
                  ["South Carolina", "Columbia"],
                  ["South Dakota", "Pierre"],
                  ["Tennessee", "Nashville"],
                  ["Texas", "Austin"],
                  ["Utah", "Salt Lake City"],
                  ["Vermont", "Montpelier"],
                  ["Virginia", "Richmond"],
                  ["Washington", "Olympia"],
                  ["West Virginia", "Charleston"],
                  ["Wisconsin", "Madison"],
                  ["Wyoming", "Cheyenne"] ]

movies_list = [ ["Raiders of the Lost Ark", 1981],
                ["Raging Bull", 1980],
                ["E.T. the Extra-Terrestrial", 1982],
                ["The Silence of the Lambs", 1991],
                ["Goodfellas", 1990],
                ["Casablanca", 1943],
                ["Gone with the Wind", 1939],
                ["The Wizard of Oz", 1939],
                ["Tommy Boy", 1995],
                ["The Hangover", 2009],
                ["Dumb & Dumber", 1994],
                ["Fight Club", 1999],
                ["The Matrix", 1999],
                ["Toy Story", 1995],
                ["Aladdin", 1992],
                ["Finding Nemo", 1993],
                ["The Blues Brothers", 1980],
                ["Pootie Tang", 2001],
                ["The Fast and the Furious", 2001],
                ["The Godfather", 1972],
                ["Forrest Gump", 1994],
                ["Saving Private Ryan", 1998],
                ["Ferris Bueller's Day Off", 1986],
                ["The Breakfast Club", 1985],
                ["Ghostbusters", 1984],
                ["Chinatown", 1974],
                ["Star Wars", 1977],
                ["When Harry Met Sally", 1989],
                ["The Princess Bride", 1987],
                ["Jurassic Park", 1993],
                ["Titanic", 1997],
                ["Jaws", 1975],
                ["Rocky", 1976],
                ["Blazing Saddles", 1974],
                ["Space Balls", 1987],
                ["Mary Poppins", 1964],
                ["The Sound of Music", 1965],
                ["Lawrence of Arabia", 1962],
                ["The Lion King", 1994],
                ["Independence Day", 1996],
                ["Slumdog Millionaire", 2008],
                ["The Big Lebowski", 1998],
                ["Seven Samurai", 1954],
                ["Pulp Fiction", 1994],
                ["Billy Madison", 1995],
                ["Ace Ventura: Pet Detective", 1994],
                ["The Terminator", 1984],
                ["Alien", 1979],
                ["Over the Top", 1979],
                ["Point Break", 1991],
                ["Ghost", 1990],
                ["Roadhouse", 1989],
                ["Pretty Woman", 1990],
                ["The Jerk", 1979],
                ["The Fifth Element", 1997],
                ["Die Hard", 1988],
                ["Beverly Hills Cop", 1984],
                ["Monty Python and the Holy Grail", 1975],
                ["Wedding Crashers", 2005],
                ["Citizen Kane", 1941],
                ["Blade Runner", 1982],
                ["Braveheart", 1995],
                ["Teenage Mutant Ninja Turtles", 1990],
                ["Home Alone", 1990],
                ["The Notebook", 2004],
                ["The Evil Dead", 1981],
                ["The Exorcist", 1973],
                ["National Lampoon's Animal House", 1978],
                ["Space Jam", 1996],
                ["Mean Girls", 2004],
                ["Dirty Dancing", 1987],
                ["Scream 3", 2000],
                ["Moulin Rouge", 2001],
                ["Clerks", 1994],
                ["Breathless", 1960],
                ["Ronin", 1998],
                ["Snow White and the Seven Dwarfs", 1937],
                ["The Hitchhiker's Guide to the Galaxy (the one with Zooey Deschanel)", 2005],
                ["The Rock", 1996],
                ["Zoolander", 2001],
                ["Jumanji", 1995],
                ["Inception", 2010],
                ["My Best Friend's Wedding", 1997],
                ["Remember the Titans", 2000],
                ["Mallrats", 1995],
                ["Super Troopers", 2001] ]


movies = Deck.create(name: "Movies")

movies_list.each do |movie|
  movies.cards << Card.create(prompt: movie[0], solution: movie[1])
end


capitols = Deck.create(name: "State Capitols")

capitols_list.each do |capitol|
  capitols.cards << Card.create(prompt: capitol[0], solution: capitol[1])
end



class NBAScraper
  attr_reader :webpage, :url, :teams, :names, :pages

  def initialize
    @pages = [
        "http://www.basketball-reference.com/play-index/psl_finder.cgi?request=1&match=single&type=totals&per_minute_base=36&lg_id=NBA&is_playoffs=N&year_min=2013&year_max=2013&franch_id=&season_start=1&season_end=-1&age_min=0&age_max=99&height_min=0&height_max=99&birth_country_is=Y&birth_country=&is_active=&is_hof=&is_as=&as_comp=gt&as_val=&pos_is_g=Y&pos_is_gf=Y&pos_is_f=Y&pos_is_fg=Y&pos_is_fc=Y&pos_is_c=Y&pos_is_cf=Y&qual=&c1stat=g&c1comp=gt&c1val=30&c2stat=mp_per_g&c2comp=gt&c2val=12&c3stat=&c3comp=gt&c3val=&c4stat=&c4comp=gt&c4val=&c5stat=&c5comp=gt&c6mult=1.0&c6stat=&order_by=ws",
        "http://www.basketball-reference.com/play-index/psl_finder.cgi?request=1&match=single&type=totals&per_minute_base=36&lg_id=NBA&is_playoffs=N&year_min=2013&year_max=2013&franch_id=&season_start=1&season_end=-1&age_min=0&age_max=99&height_min=0&height_max=99&birth_country_is=Y&birth_country=&is_active=&is_hof=&is_as=&as_comp=gt&as_val=&pos_is_g=Y&pos_is_gf=Y&pos_is_f=Y&pos_is_fg=Y&pos_is_fc=Y&pos_is_c=Y&pos_is_cf=Y&qual=&c1stat=g&c1comp=gt&c1val=30&c2stat=mp_per_g&c2comp=gt&c2val=12&c3stat=&c3comp=gt&c3val=&c4stat=&c4comp=gt&c4val=&c5stat=&c5comp=gt&c6mult=1.0&c6stat=&order_by=ws&order_by_asc=&offset=100",
        "http://www.basketball-reference.com/play-index/psl_finder.cgi?request=1&match=single&type=totals&per_minute_base=36&lg_id=NBA&is_playoffs=N&year_min=2013&year_max=2013&franch_id=&season_start=1&season_end=-1&age_min=0&age_max=99&height_min=0&height_max=99&birth_country_is=Y&birth_country=&is_active=&is_hof=&is_as=&as_comp=gt&as_val=&pos_is_g=Y&pos_is_gf=Y&pos_is_f=Y&pos_is_fg=Y&pos_is_fc=Y&pos_is_c=Y&pos_is_cf=Y&qual=&c1stat=g&c1comp=gt&c1val=30&c2stat=mp_per_g&c2comp=gt&c2val=12&c3stat=&c3comp=gt&c3val=&c4stat=&c4comp=gt&c4val=&c5stat=&c5comp=gt&c6mult=1.0&c6stat=&order_by=ws&order_by_asc=&offset=200",
        "http://www.basketball-reference.com/play-index/psl_finder.cgi?request=1&match=single&type=totals&per_minute_base=36&lg_id=NBA&is_playoffs=N&year_min=2013&year_max=2013&franch_id=&season_start=1&season_end=-1&age_min=0&age_max=99&height_min=0&height_max=99&birth_country_is=Y&birth_country=&is_active=&is_hof=&is_as=&as_comp=gt&as_val=&pos_is_g=Y&pos_is_gf=Y&pos_is_f=Y&pos_is_fg=Y&pos_is_fc=Y&pos_is_c=Y&pos_is_cf=Y&qual=&c1stat=g&c1comp=gt&c1val=30&c2stat=mp_per_g&c2comp=gt&c2val=12&c3stat=&c3comp=gt&c3val=&c4stat=&c4comp=gt&c4val=&c5stat=&c5comp=gt&c6mult=1.0&c6stat=&order_by=ws&order_by_asc=&offset=300"
        ]
    @names = []
    @teams = []
    @url = ""
    @webpage = ""

    @pages.each do |page|
      @url = page
      @webpage = fetch!
      find_players!
      find_teams!
    end
  end

  def fetch!
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    Nokogiri::HTML(response.body)
  end

  def find_players!
    @webpage.css("tbody tr td:nth-child(2)").map {|noko| @names << noko.text}
  end

  def find_teams!
    @webpage.css("tbody tr td:nth-child(6)").map {|noko| @teams << noko.text}
  end
end

scraper = NBAScraper.new

players_list = scraper.names.zip(scraper.teams)

players_list.each_with_index do |player, i|
  if player[1] == "TOT"
    players_list.delete_at(i)
  end
end



players = Deck.create(name: "Who He Play For?")

players_list.each do |player|
  players.cards << Card.create(prompt: player[0], solution: player[1])
end
