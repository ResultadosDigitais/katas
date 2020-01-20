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


  def add_first_member_to_each_team 
    @schedule = {}
    team_position = 0  
    member_position = 0
    week_number = 1

    (team_position..(count_teams - 1)).each do |team_position|
      @schedule[@teams_and_members[team_position][:team].to_sym] = {
        "#{week_number}" => @teams_and_members[team_position][:members][member_position]
      }
    end
    @schedule
  end

  def add_member_to_schedule(team_position, member_position, week_number)
    @schedule[@teams_and_members[team_position][:team].to_sym].merge!({
      "#{week_number}" => @teams_and_members[team_position][:members][member_position] 
    })
    @schedule              
  end

  def build_schedule
    add_first_member_to_each_team #ja tem uma pessoa na primeira semana de cada time

    (0..count_teams).each do |team_position| #team position comeca com 0
      
      #Se tem apenas um membro na equipe
      if (count_members[team_position] == 1)
       
        (2..@weeks).each do |week_number|
          add_member_to_schedule(team_position, 0, week_number)
        end
      #Se tem mais de um membro & mais semanas que membros
      # elsif (count_members[team_position] < @weeks) 

      #Se tem mais de um membro & mais membros que semanas
      else    
        (2..@weeks).each do |week_number|
          (1..(count_members[team_position] - 1)).each do |member_position|       
             add_member_to_schedule((week_number-1),(week_number-1), week_number)
           end    
        end
      end
    end
    @schedule
  end

end

  # def add_members_to_schedule(week_number)
  #   team_position = 0  
  #   member_position = 0
  #   week_number = 1
  #     (1.. week_number).each do |member_position|
  #       add_member_to_schedule()
  #       member_position = member_position + 1
  #   end
  #   @schedule
  # end
  

  # def show_schedule 
  #     a = 1 # a ja comeca em 1, se o time tiver 1 so pessoa, essa pessoa nao repete.
  #     if (@weeks > 1)        
  #         if count_members[i] < @weeks # entrou nesse if, sao os casos de excecoes que precisamos repetir os membros
  #             while (a < (@weeks)) do
  #               # require 'pry'
  #               # binding.pry
  #               (2..@weeks).each do |j| #esta parte do jeito que esta escrita nao esta fazendo nada                 
  #                 schedule[@teams_and_members[i][:team].to_sym].merge!({
  #                   "#{j}" => @teams_and_members[i][:members][a] 
  #                 })               
  #                 a=a+1
  #                 binding.pry
  #               end
  #             end
  #             a = 0
  #             j = (count_members[i]+1)
  #             (j..@weeks).each do |j| # 2 membros e 3 semanas funciona....mas se 3 membros e 4 semanas ja nao funciona 
  #               # binding.pry
  #               schedule[@teams_and_members[i][:team].to_sym].merge!({
  #               "#{j}" => @teams_and_members[i][:members][a]
  #               }) 
  #               a=a+1
  #               # binding.pry
  #             end  
  #         else #faz normal se o numero de pessoas for igual ou maior que weeks aloca um depois do outro, ta correta
  #           (2..@weeks).each do |j|
  #             # binding.pry
  #             schedule[@teams_and_members[i][:team].to_sym].merge!({
  #               "#{j}" => @teams_and_members[i][:members][j-1]
  #             })
  #             # binding.pry
  #           end 
  #         end
  #     end  
  #   end
  #   # binding.pry
  #   # schedule 
  # end
