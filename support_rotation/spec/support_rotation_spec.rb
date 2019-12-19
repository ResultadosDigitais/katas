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
end