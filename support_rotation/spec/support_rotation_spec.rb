require './support_rotation'

RSpec.describe SupportRotation do
  describe "Register new Team and members" do
    it "registers multiple teams and members" do
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
    it "registers number of weeks" do
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

  describe "Add member to schedule" do
    it "Adds first member to each team's schedule" do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)
  
      expect(support_rotation.add_first_member_to_each_team).to eq(
        {
          email: { '1'=> 'yuri'},
          cdp: {'1'=> 'jean g'}
        }
      )
    end

    it "Adds member to schedule" do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)
      support_rotation.add_first_member_to_each_team 

      expect(support_rotation.add_member_to_schedule(0,1,2)).to eq(
        {
          email: { '1'=> 'yuri', '2'=>'rogerio'},
        }
      )
    end
  end

  describe "Build schedule repeating member if #members==1" do #repete o mesmo membro para todas as semanas
    it "returns same member every week" do
      teams_and_members = [
        {team: 'email', members: ['yuri']},
        {team: 'cdp', members: ['jean g']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.build_schedule).to eq(
        {
          email: { '1'=> 'yuri', '2'=> 'yuri'},
          cdp: {'1'=> 'jean g', '2'=> 'jean g'}
        }
      )
    end
  end

  describe "Build schedule if #members is bigger than #weeks" do #parar a sequencia quando atinge numero de semanas
    it "returns same member sequence"  do
      teams_and_members = [
        {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
        {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
      ]
      support_rotation = SupportRotation.new(teams_and_members, 2)

      expect(support_rotation.build_schedule).to eq(
        {
          email: { '1'=> 'yuri', '2'=> 'rogerio'},
          cdp: {'1'=> 'jean g', '2'=> 'jean m'}
        }
      )
    end
  end

  describe "Build schedule repeating member sequence if #members smaller than #weeks" do 
    it "returns same member sequence"  do
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
        })
    end
  end

  # describe "Show schedule of teams and members per week" do
  #   it "returns team and members schedule" do
  #     teams_and_members = [
  #       {team: 'email', members: ['yuri', 'rogerio', 'gabriel']},
  #       {team: 'cdp', members: ['jean g', 'jean m', 'vinicius']}
  #     ]
  #     support_rotation = SupportRotation.new(teams_and_members, 2)

  #     expect(support_rotation.show_schedule).to eq(
  #       {
  #         Email: { '1'=> 'Yuri', '2'=> 'Rogerio'},
  #         Cdp: {'1'=> 'Jean G', '2'=> 'Jean M'}
  #       }
  #     )
  #   end
  # end

end

