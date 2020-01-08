class SupportRotation 
  def initialize(teams_and_members, weeks = nil)
    @teams_and_members = teams_and_members
    @weeks = weeks
  end

  def show
    @teams_and_members
  end
  # @teams_and_members = [
  #   {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
  #   {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
  # ]

  # {
  #   email: { '1'=> 'yuri', '2'=> 'gabriel'},
  #   cpd: {'1'=> 'jean g', '2'=> 'jean m' }
  # }

  def show_schedule
    schedule = {}
    (1..2).each do |i|
      require 'pry'
      binding.pry
      schedule[@teams_and_members[i-1][:team].to_sym] = {
        "#{i}" => @teams_and_members[i-1][:members][i-1], "#{i+1}" => @teams_and_members[i][:members][i]
      }
      i=i-1
      binding.pry
    end
    schedule
  end
end