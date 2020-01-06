class SupportRotation 
  def initialize(teams_and_members, weeks = nil)
    @teams_and_members = teams_and_members
    @weeks = weeks
  end

  def show
    @teams_and_members
  end

  def show_schedule
    schedule = {1 => @teams_and_members}

    schedule.each do |week, team_and_members|
      team_and_members.each do |team|
        team.each do |members|
          puts "#{schedule}"
        end
      end
    end
  end
end