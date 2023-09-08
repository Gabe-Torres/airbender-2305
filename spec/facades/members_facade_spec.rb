require 'rails_helper'

RSpec.describe 'Members Facade', :vcr do
  context 'instance methods' do
    scenario '#members' do
      members = MembersFacade.members_by_nation('Fire Nation')

      members.each do |member|
        expect(member).to be_a Member
      end

      expect(members.count).to eq(20)
      expect(members).to be_an(Array)
    end
  end
end