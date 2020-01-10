require './support_rotation'

RSpec.describe SupportRotation do
  describe "Register new Team and members" do
    it "register multiple teams and members" do
      support_rotation =  SupportRotation.new(
        [
          { team: 'pope', members: ['bretan', 'robert', 'raites'] },
          { team: 'shield', members: ['liz', 'guilherme', 'thiago'] }
        ]
      )
      expect(support_rotation).to be_instance_of(SupportRotation)
    end
  end

  describe "Insert duration of the operation in weeks" do
    it "register number of weeks" do
      teams_and_members = []
      weeks = 0
      support_rotation = SupportRotation.new(teams_and_members, weeks)
      expect(support_rotation).to be_instance_of(SupportRotation)
    end
  end

  describe "Show teams and members lists" do
    it "returns teams and members lists" do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]

      support_rotation = SupportRotation.new(teams_and_members)

      expect(support_rotation.show).to eq(teams_and_members)
    end
  end

  describe "Show schedule of teams and members per week" do
    it "returns team and members schedule" do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.show_schedule).to eq(
        {
          Email: { '1'=> 'Yuri', '2'=> 'Rogerio'},
          Cdp: {'1'=> 'Jean G', '2'=> 'Jean M'}
        }
      )
    end
  end

  describe "Repeat member if #members==1 < #weeks" do
    it "return same member every week" do
      teams_and_members = [
        {team: 'email', members: ['yuri']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.show_schedule).to eq(
        {
          Email: { '1'=> 'Yuri', '2'=> 'Yuri'},
          Cdp: {'1'=> 'Jean G', '2'=> 'Jean M' }
        }
      )
    end
  end

  describe "Repeat member sequence if #members smaller than  #weeks" do
    it "return same member sequence"  do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 5)

      expect(support_rotation.show_schedule).to eq(
        {
          Email: { '1'=> 'Yuri', '2'=> 'Rogerio', '3'=> 'Gabriel', '4'=> 'Yuri', '5'=> 'Rogerio'},
          Cdp: {'1'=> 'Jean G', '2'=> 'Jean M', '3'=> 'Vinicius', '4'=> 'Jean G', '5'=> 'Jean M'}
        }
      )
    end
  end

  describe "Capitalize teams" do
    it "Returns capitalized teams'names" do
        teams_and_members = [
          {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
          {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
        ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.show_schedule).to eq(
        {
          Email: { '1'=> 'Yuri', '2'=> 'Rogerio'},
          Cdp: {'1'=> 'Jean G', '2'=> 'Jean M' }
        }
      )
    end
  end

  describe "Capitalize names" do
    it "Returns capitalized members' names" do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.show_schedule).to eq(
        {
          Email: { '1'=> 'Yuri', '2'=> 'Rogerio'},
          Cdp: {'1'=> 'Jean G', '2'=> 'Jean M' }
        }
      )
    end
  end
end

