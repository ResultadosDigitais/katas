class SupportRotation 
  def initialize(teams_and_members, weeks = nil)
    @teams_and_members = teams_and_members
    @weeks = weeks
  end

  def show
    @teams_and_members
  end

  def show_schedule
    schedule = []
    week = 1 
    schedule = [week, @teams_and_members]
  end
end