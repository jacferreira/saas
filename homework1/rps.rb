class WrongNumberOfPlayersError < StandardError ;end
class NoSuchStrategyError < StandardError ;end

def validate_player_strategy(player)
  raise NoSuchStrategyError unless
    ["R", "P", "S"].include?(player[1].upcase)
  return true
end

def find_winner(player_1, player_2)
  strategy_1 = player_1[1].upcase
  strategy_2 = player_2[1].upcase

  if strategy_1 == strategy_2
    return player_1
  end

  case strategy_1
  when "R"
    case strategy_2
    when "P"
      return player_2
    when "S"
      return player_1
    end
  when "P"
    case strategy_2
    when "R"
      return player_1
    when "S"
      return player_2
    end
  when "S"
    case strategy_2
    when "R"
      return player_2
    when "P"
      return player_1
    end
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  player_1 = game[0]
  player_2 = game[1]
  validate_player_strategy(player_1)
  validate_player_strategy(player_2)
  return find_winner(player_1, player_2)
end

def rps_sub_tournament_winner(sub_tournament)
  return rps_game_winner(sub_tournament.collect {|game| rps_game_winner(game)})
end

def rps_tournament_winner(tournament)
  return rps_game_winner(tournament.collect {|sub_tournament| rps_sub_tournament_winner(sub_tournament)})
end

def is_player?(player)
  if player.length == 2 &&
      player[0].class == String &&
      validate_player_strategy(player)
    return true
  else
    return false
  end
end

def is_game?(game)
  if game.length == 2 && is_player?(game[0]) && is_player?(game[1])
    return true
  else
    return false
  end
end

def rps_tournament_winner_r (tournament)
  if is_game?(tournament)
    return rps_game_winner(tournament)
  else
    rps_game_winner([rps_tournament_winner_r(tournament[0]),
                     rps_tournament_winner_r(tournament[1])])
  end
end


print rps_tournament_winner_r([
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
])
