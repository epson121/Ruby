#Luka Rajcevic 27.07. 2012.
#Rock-Paper-Scissors


class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |sign|
	if sign[1] != "R" and sign[1] != "P" and sign[1] != "S"
		raise NoSuchStrategyError
	end
  end
  if game[0][1] == "R" and game[1][1] != "P"
	return game[0]
  elsif game[0][1] == "P" and game[1][1] != "S"
	return game[0]
  elsif game[0][1] == "S" and game[1][1] != "R"
	return game[0]
  else
	return game[1]
  end
end
s =  [ ["Richard", "R"],  ["Michael", "R"] ]
rps_game_winner([ ["Richard", "R"],  ["Michael", "R"] ])

def contains_game(game)
  return game[0][0].is_a?(String)
end


def rps_tournament_winner(tournament)
	if contains_game(tournament)
		return rps_game_winner(tournament)
	end
  rps_game_winner [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]
end

tournament_list = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

