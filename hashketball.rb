require "pry" 

def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end 


def num_points_scored (player_n)
  game_hash.each do |location,team| #iterating over hash, having a key value pair 
    team[:players].each do |player| #index as the second param inside the pipes 
      if player_n == player[:player_name]
       return player[:points] 
      end 
    end 
  end
  return "didn't find the player's name" 
end 


def shoe_size(player_n)
  game_hash.each do |location, team|
    team[:players].each do |player|
     if player_n == player[:player_name]
      return player[:shoe] 
     end   
    end 
  end 
  return "didn't find the player's name"
end 
 
 def team_colors(team_name)
    game_hash.each do |location,team|
      #binding.pry
      if (team[:team_name] == team_name)
       return (team[:colors]).to_a
      end 
    end 
 end 
 
def team_names 
  game_hash.map do |location, team|
    team[:team_name]
  end 
end 

def player_numbers (team_name)
  game_hash.map do |location,team| 
    team[:players].map do |player|
      if (team[:team_name] == team_name)
         return team[:players].map {|player| player[:number]}
      end 
    end 
  end 
end 
#in the method player_numbers, we returned an array (iterating through it to build it, of the players numbers)

def player_stats(player_n)
 # binding.pry
  game_hash.map do |location,team| 
    team[:players].map do |player|
      if player[:player_name] == player_n
        #binding.pry
      # return player.delete_if {|stats, value| == player[:player_name]}
      return player.delete_if { |stat, value| [:player_name].include?(stat)}
      end 
    end 
  end 
  return "you idiot, your numbers are wrong"
end 

def big_shoe_rebounds
  biggest = 0
  rebounds = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored 
 biggest= 0 #initialization of biggest at 0 points 
 player_with_most_points = " " #blank string to hold name 
  game_hash.map do |location, team|
    team[:players].map do |player|  
    score = player[:points] # score is the player at their points value 
      #binding.pry 
      if score > biggest #which we know to be true until the largest value is left as the biggest number 
      biggest = score
      #below is the code im focusing on. below is what i need to change 
      player_with_most_points = player[:player_name]
      #binding.pry 
      end 
    end 
  end 
  player_with_most_points 
end 
## when you are initializing values or where to look for them, you need to be explicit when you assign variables at at what point it should collect values associated with where in your data you want to stop or collect data. my problem was that i didnt tell the method to grab the person_with_the most_points at the moment that score was the highest value 


#add up all of the points and compare the two teams. report back who had the highest number 

def winning_team
  total_points = 0 #initialize points at zero 
  
  win_team = '' #set win team to an empty string 
  
  game_hash.each do |location, team| #iterating over game hash
    team_points = 0 #initialize team points at zero 
    team_name = game_hash[location][:team_name] 
    # set team name = to game_hash at the the location at the  # :team name 
  
    team[:players].each do |player| #iterate over players 
      points = player[:points] # set points = player points 
      team_points += points #team points is the addition of every single point value from each player
  
      #binding.pry 
    end
  
    win_team, total_points = team_name, team_points if team_points > total_points
   
    #binding.pry 
  
  end
  
  return win_team

end

# # most similiar to most scored points 
# def player_with_longest_name
#   longest_name = ''
#   longest_length = 0 
#   game_hash.map do |location,team|
#     team[:players].map do |player|
#       name = player[:player_name]
#       #layered down to iterate through player names 
#       name_length = player[:player_name].length 
#       longest, name_length, if name_length > longest_length
#     end   
#   end 
#   longest_name
# end 

def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end

