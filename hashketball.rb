require 'pry'


#method returns a nested hash
def game_hash

  bball = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {:player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {:player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {:player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {:player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }

    ] #players
  }, #home

  :away => {

    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {:player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {:player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {:player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {:player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }

    ] #players
  } #away
} #bball
return bball
end



def good_practices
  game_hash.each do |location, team_data| #(:home => hash of team data)
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!

    team_data.each do |attribute, data| #(:team_name => "brooklyn nets"), (:players => array of hashes)
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!


        if attribute == :players
          data.each do |hash_attributes| #hash of hashes
            hash_attributes.each do |key, value| #(:player_name => "Alan Anderson")

          end #hash_attributes.each
        end #data.each
      end #if
    end #team_data.each
  end #game_hash.each
end
good_practices #instead of executing learn, call good_practices and execute ruby hashketball.rb


# def num_points_scored(player)
#   game_hash.each do |location, team_data| #(:home => hash of team data)
#     team_data.each do |attribute, data| #(:team_name => "brooklyn nets"), (:players => array of hashes)
#         if attribute == :players
#           data.each do |hash_attributes| #hash of hashes
#
#             hash_attributes.each do |key, value| #(:player_name => "Alan Anderson")
#               if :player_name == player
#                 binding.pry
#                 return :points
#                 binding.pry
#               end #if
#           end #hash_attributes.each
#         end #data.each
#       end #if
#     end #team_data.each
#   end #game_hash.each
# end
# num_points_scored

def num_points_scored(player)
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      if profile[:player_name] == player
        return profile[:points]
      end #if
    end #keys[:players]
  end #game_hash
end

 def shoe_size(player)
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      return profile[:shoe] if profile[:player_name] == player
    end #keys
  end #game_hash
 end

def team_colors(team)
  game_hash.each do |location, keys|
    if keys[:team_name] == team
      return keys[:colors]
    end #if
  end #game_hash
end

def team_names
  team_names = []
  game_hash.each do |location, keys|
    team_names << keys[:team_name]
  end
  team_names
end

def player_numbers(team)
  player_numbers = []
  game_hash.each do |location, keys|
    if keys[:team_name] == team
      keys[:players].each do |profile|
        player_numbers.push(profile[:number])
      end #keys
    end #if
  end #game_hash
  player_numbers
end

def player_stats(player)
  stats = nil
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      if profile[:player_name] == player
        stats = profile
        stats.delete(:player_name)
      end #if
    end #keys
  end #game_hash
  stats
end

def big_shoe_rebounds
  rebounder = game_hash[:home][:players][0]
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      if profile[:shoe] > rebounder[:shoe]
        rebounder = profile
      end #if
    end #keys
  end #game_hash
  rebounder[:rebounds]
end

def most_points_scored
  scorer = game_hash[:home][:players][0]
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      if profile[:points] > scorer[:points]
        scorer = profile
      end #if
    end #keys
  end #game_hash
  scorer[:player_name]
end

def winning_team
  winner = ""
  winning_total = 0
  total = 0
  game_hash.each do |location, keys|
      total = 0
      keys[:players].reduce(total) do |memo, profile|

      total += profile[:points]
      memo
    end #keys[:players].reduce

    if total > winning_total
      winning_total = total
      winner = keys[:team_name]
    end #if
  end # game_hash
  winner
end


def player_with_longest_name
  longest = game_hash[:home][:players][0]
  game_hash.each do |location, keys|
    keys[:players].each do |profile|
      if profile[:player_name].length > longest[:player_name].length
        longest = profile
      end #if
    end #keys
  end #game_hash
  longest[:player_name]
end

def long_name_steals_a_ton?
  longest = game_hash[:home][:players][0]
  steals = game_hash[:home][:players][0]

  game_hash.each do |location, keys|
    keys[:players].each do |profile|

      if profile[:player_name].length > longest[:player_name].length
        longest = profile
      end #if
      if profile[:steals] > steals[:steals]
        steals = profile
      end #if
    end #keys
  end #game_hash
  longest == steals ? true : false
end
