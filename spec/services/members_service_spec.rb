require 'rails_helper'

describe MembersService, :vcr do
  context 'class methods' do
    context '#members_by_nation' do
      it 'returns members' do
        members = MembersService.members_by_nation('Fire Nation')

        expect(members).to be_an(Array)
        expect(members.count).to eq(20)
        expect(members.first).to be_a(Hash)
        expect(members.first).to have_key(:name)
        expect(members.first).to have_key(:allies)
        expect(members.first).to have_key(:enemies)
        expect(members.first).to have_key(:affiliation)
      end
    end
  end
end
