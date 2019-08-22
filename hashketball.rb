require "pry"

# Set Up
def game_hash
  {
    :home => make_team("Brooklyn Nets", ["Black", "White"]),
    :away => make_team("Charlotte Hornets", ["Turquoise", "Purple"])
  }
end

def make_team(team_name, colors)
  team = {
    :team_name => team_name,
    :colors => colors,
    :players => {}
  }
  
  if team_name == "Brooklyn Nets"
    team[:players]["Alan Anderson"] = 
      make_player([0, 16, 22, 12, 12, 3, 1, 1])
    team[:players]["Reggie Evans"] = 
      make_player([30, 14, 12, 12, 12, 12, 12, 7])
    team[:players]["Brook Lopez"] = 
      make_player([11, 17, 17, 19, 10, 3, 1, 15])
    team[:players]["Mason Plumlee"] = 
      make_player([1, 19, 26, 11, 6, 3, 8, 5])
    team[:players]["Jason Terry"] = 
      make_player([31, 15, 19, 2, 2, 4, 11, 1])
  end
  
  if team_name == "Charlotte Hornets"
    team[:players]["Jeff Adrien"] = 
      make_player([4, 18, 10, 1, 1, 2, 7, 2])
    team[:players]["Bismack Biyombo"] = 
      make_player([0, 16, 12, 4, 7, 22, 15, 10])
    team[:players]["DeSagna Diop"] = 
      make_player([2, 14, 24, 12, 12, 4, 5, 5])
    team[:players]["Ben Gordon"] = 
      make_player([8, 15, 33, 3, 2, 1, 1, 0])
    team[:players]["Kemba Walker"] =
      make_player([33, 15, 6, 12, 12, 7, 5, 12])
  end
  
  team
end

def make_player(stats)
  # Names should be added to this...
  {
    :number => stats[0],
    :shoe => stats[1],
    :points => stats[2],
    :rebounds => stats[3],
    :assists => stats[4],
    :steals => stats[5],
    :blocks => stats[6],
    :slam_dunks => stats[7], 
  }
end

# Methods 
def num_points_scored(player_name)
  get_player_stat(player_name, :points)
end

def shoe_size(player_name)
  get_player_stat(player_name, :shoe)
end

def get_player_stat(player_name, stat_name)
  game_hash.each_pair do |home_or_away, team|
    team[:players].each_pair do |name, stats|
      return stats[stat_name] if name == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each_pair do |home_or_away, team|
    return team[:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.map do |home_or_away, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each_pair do |home_or_away, team|
    return team[:players].map { |name, stats| stats[:number] } if team[:team_name] == team_name
  end
end

def player_stats(player_name)
  game_hash.each_pair do |home_or_away, team|
    team[:players].map do |name, stats| 
      return stats if name == player_name
    end
  end
end

def big_shoe_rebounds
  player_name = biggest_shoe
  get_player_stat(player_name, :rebounds)
end

def biggest_shoe
  get_name_with_biggest_stat(:shoe)
end

def most_points_scored
  get_name_with_biggest_stat(:points)
end

def get_name_with_biggest_stat(stat)
  largest_known_value = 0
  player_name = nil
  
  game_hash.each_pair do |home_or_away, team|
    team[:players].each_pair do |name, stats|
      if stats[stat] > largest_known_value
        largest_known_value = stats[stat]
        player_name = name
      end
    end
  end
  
  player_name
end

def winning_team
  bnets_points = 0
  chorn_points = 0
  
  game_hash.each_pair do |home_or_away, team|
    team[:players].each_pair do |name, stats|
      bnets_points += stats[:points] if team[:team_name] == "Brooklyn Nets"
      chorn_points += stats[:points] if team[:team_name] == "Charlotte Hornets"
    end
  end
  
  bnets_points > chorn_points ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  longest_name = 0
  player_name = nil
  
  game_hash.each_pair do |home_or_away, team|
    team[:players].each_pair do |name, stats|
      if name.length > longest_name
        longest_name = name.length 
        player_name = name
      end
    end
  end
  
  player_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  player_with_most_steals = get_name_with_biggest_stat(:steals)
  
  longest_name == player_with_most_steals ? true : false
end