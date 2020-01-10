require 'unicode_utils'
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
    for i in (0..(count_teams-1))
      @qtd_members[i] = @teams_and_members[i][:members].length
    end
    @qtd_members
  end

  def capitalize_teams
    for i in (0..(count_teams-1))      
      @teams_and_members[i][:team].capitalize!      
    end
  end

  # def capitalize_members
  #   for i in (0..(count_teams-1))
  #     for j in (0..(count_members-1))
  #       @teams_and_members[i][:members][j]
  #     end
  #   end
  # end

  def show_schedule   
    capitalize_teams 
    #capitalize_members  
    schedule = {}
    (0..(count_teams - 1)).each do |i|       
      schedule[@teams_and_members[i][:team].to_sym] = {
        "#{1}" => @teams_and_members[i][:members][0].split.map(&:capitalize).join(' ')
      }
      a = 1
      if (@weeks > 1)        
          if count_members[i] < @weeks
              while (a < (@weeks)) do
                (2..(@weeks)).each do |j|                  
                  schedule[@teams_and_members[i][:team].to_sym].merge!({
                    "#{j}" => @teams_and_members[i][:members][a].split.map(&:capitalize).join(' ')
                  })               
                  a=a+1
                end
              end
                a=0
                j = count_members[i]
                (j..@weeks).each do |j|
                 schedule[@teams_and_members[i][:team].to_sym].merge!({
                 "#{j}" => @teams_and_members[i][:members][a].split.map(&:capitalize).join(' ')
                 }) 
                 a=a+1
                 end  
          else
            (2..@weeks).each do |j|
              schedule[@teams_and_members[i][:team].to_sym].merge!({
                "#{j}" => @teams_and_members[i][:members][j-1].split.map(&:capitalize).join(' ')
              })
            end 
          end
      end  
    end
    schedule
  end
end



# schedule = {
#   team [0] => { week 1 => member[0], week 2 => member [1], week 3 => member[2],
#                 week 4=> member[0]
#   }
# }

