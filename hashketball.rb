require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
       {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },

        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },

        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },

        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },

        {
          :player_name => "Jason Terry",
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
        
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
          
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
          
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        
        {
          :player_name => "Kemba Walker",
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
    }
  }
end

def num_points_scored(name)
  game_hash.each do |k, v|
    v[:players].each do |stats|
      return stats[:points] if stats[:player_name] == name
    end
  end
end

def shoe_size(name)
  game_hash.each do |k, v|
    v[:players].each do |stats|
      return stats[:shoe] if stats[:player_name] == name
    end
  end
end

def team_colors(team)
  game_hash[:away][:team_name] == team ? game_hash[:away][:colors] : game_hash[:home][:colors]
end

def team_names
  team_names = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  which_team = :home
  which_team = :away if game_hash[:away][:team_name] == team 
  player_nums = []
  game_hash[which_team][:players].each { |n| player_nums << n[:number] }
  player_nums
end

def player_stats(name)
  player_stat = {}
  game_hash.each do |k, v|
    v[:players].each do |stats|
      player_stat = stats if stats[:player_name] == name
    end
  end
  player_stat.shift
  player_stat
end

def big_shoe_rebounds 
  rebounds = 0
  shoe = 0
  game_hash.each do |k, v|
    v[:players].each do |stats|
      if stats[:shoe] > shoe
        shoe = stats[:shoe] 
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  player = "Krista Loven"
  game_hash.each do |k, v|
    v[:players].each do |stats|
      if stats[:points] > points
        points = stats[:points] 
        player = stats[:player_name]
      end
    end
  end
  player
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each { |stats| home_score += stats[:points] }
  game_hash[:away][:players].each { |stats| away_score += stats[:points] }
  home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  name_length = 0
  name = "Krista Loven"
  game_hash.each do |k, v|
    v[:players].each do |stats|
      if stats[:player_name].length > name_length
        name_length = stats[:player_name].length
        name = stats[:player_name]
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  name_length = 0
  name = "Krista Loven"
  long_name_steals = 0
  max_steals = 0
  game_hash.each do |k, v|
    v[:players].each do |stats|
      if stats[:player_name].length > name_length
        name_length = stats[:player_name].length
        name = stats[:player_name]
        long_name_steals = stats[:steals]
      end
      if stats[:steals] > max_steals
        max_steals = stats[:steals]
      end
    end
  end
  long_name_steals == max_steals ? true : false
end
