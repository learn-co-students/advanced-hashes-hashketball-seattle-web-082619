require "pry"

def game_hash()
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    },
  }
  return game
end

def num_points_scored(player_name)
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v[:points]
      end
    end
  end
  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v[:shoe]
      end
    end
  end
  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    arr = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    arr = game_hash[:away][:colors]
  end
  return arr
end

def team_names()
  #return arr of team names
  teams_arr = []
  teams_arr.push(game_hash[:home][:team_name])
  teams_arr.push(game_hash[:away][:team_name])
  return teams_arr
end

def player_numbers(team_name)
  numbers_arr = []

  if game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |key, val|
      key.each do |k, v|
        numbers_arr.push(v[:number])
      end
    end
  elsif game_hash[:home][:team_name] == team_name
      game_hash[:home][:players].each do |key, val|
      key.each do |k, v|
        numbers_arr.push(v[:number])
      end
    end
  end
  return numbers_arr
end

def player_stats(player_name)
#return hash of player stats
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v
      end
    end
  end
  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if k == player_name
        return v
      end
    end
  end
end

def big_shoe_rebounds()
  player_big_shoe = game_hash[:home][:players][0].first

  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if v[:shoe] > player_big_shoe[1][:shoe]
        player_big_shoe[0] = k
        player_big_shoe[1] = v
      end
    end
  end
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if v[:shoe] > player_big_shoe[1][:shoe]
        player_big_shoe[0] = k
        player_big_shoe[1] = v
      end
    end
  end

  return player_big_shoe[1][:rebounds]
end

def most_points_scored()
  high_scorer = game_hash[:home][:players][0].first

  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if v[:points] > high_scorer[1][:points]
        high_scorer[0] = k
        high_scorer[1] = v
      end
    end
  end
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if v[:points] > high_scorer[1][:points]
        high_scorer[0] = k
        high_scorer[1] = v
      end
    end
  end
  return high_scorer[0]
end

def winning_team()
  home_team = 0
  away_team = 0

  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      home_team += v[:points]
    end
  end
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      away_team += v[:points]
    end
  end
  if home_team > away_team
    return game_hash[:home][:team_name]
  elsif away_team > home_team
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name()
  longest_name = game_hash[:home][:players][0].first
  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if k.length > longest_name[0].length
        longest_name[0] = k
        longest_name[1] = v
      end
    end
  end
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if k.length > longest_name[0].length
        longest_name[0] = k
        longest_name[1] = v
      end
    end
  end
  return longest_name[0]
end

def long_name_steals_a_ton?()
  longest_name_player = player_with_longest_name()
  most_steals = game_hash[:home][:players][0].first

  game_hash[:home][:players].each do |key, val|
    key.each do |k, v|
      if v[:steals] > most_steals[1][:steals]
        most_steals[0] = k
        most_steals[1] = v
      end
    end
  end
  game_hash[:away][:players].each do |key, val|
    key.each do |k, v|
      if v[:steals] > most_steals[1][:steals]
        most_steals[0] = k
        most_steals[1] = v
      end
    end
  end

  if most_steals[0] == longest_name_player
    return true
  else
    return false
  end
end
