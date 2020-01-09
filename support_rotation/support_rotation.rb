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
  
  # @teams_and_members = [
  #   {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
  #   {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
  # ]

  # {
  #   email: { '1'=> 'yuri', '2'=> 'rogerio'},
  #   cpd: {'1'=> 'jean g', '2'=> 'jean m' }
  # }

  def show_schedule
    schedule = {}
    (0..(count_teams - 1)).each do |i|
      require 'pry'
      binding.pry        
      schedule[@teams_and_members[i][:team].to_sym] = {
        "#{1}" => @teams_and_members[i][:members][0]
      }
      binding.pry
      (2..@weeks).each do |j|
        binding.pry
        schedule[@teams_and_members[i][:team].to_sym].merge!({
          "#{j}" => @teams_and_members[i][:members][j-1]
        })
        binding.pry
      end
    end
    schedule
  end
end
# schedule {
#   time [0] => { week 1 => membro[0] , week 2 => membro[1]} ,
#   time [1] => { week 1 => membro[0] , week 2 => membro[1]}
# }

#  time [0] => { week 1 => membro[0], week 2 =>membro [1]}
                                 