class SupportRotation 
  def initialize(teams_and_members, weeks = nil)
    @teams_and_members = teams_and_members
    @weeks = weeks    
  end

  def show
    @teams_and_members
  end

  def count_teams 
    @teams_and_members.length 
  end

  def count_members
    @qtd_members = []
    for i in (0..(count_teams - 1))
      @qtd_members[i] = @teams_and_members[i][:members].length
    end
    @qtd_members
  end

  def show_schedule
    schedule = {}
    (0..(count_teams - 1)).each do |i|       
      schedule[@teams_and_members[i][:team].to_sym] = {
        "#{1}" => @teams_and_members[i][:members][0]
      }
      #require 'pry'
      #binding.pry
      if (@weeks > 1)        
        (2..@weeks).each do |j|
          if count_members[i] < @weeks
            #binding.pry 
            schedule[@teams_and_members[i][:team].to_sym].merge!({
              "#{j}" => @teams_and_members[i][:members][0]
            })
          else
          schedule[@teams_and_members[i][:team].to_sym].merge!({
              "#{j}" => @teams_and_members[i][:members][j-1]
            })
          end
        end
      end  
    end
    schedule
  end
end

