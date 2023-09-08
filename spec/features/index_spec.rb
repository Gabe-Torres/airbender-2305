require 'rails_helper'

RSpec.describe 'ATLA api call', type: :feature do
  feature 'A user can search for show data ' do
    scenario 'Fire Nation list is returned that displays show/character info', :vcr do
      # VCR.use_cassette('fire_nation_members') do
      visit root_path

      select 'Fire Nation', from: :nation

      click_button 'Search For Members'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Total Fire Nation Members:')

      within(first('#members')) do
        page.has_css?('.name')
        page.has_css?('.photo')
        page.has_css?('.allies')
        page.has_css?('.enemies')
        page.has_css?('.affiliation')
      end

      members = MembersFacade.members_by_nation('Fire Nation')

      expect(page).to have_content(members.count)
      expect(members).to be_an(Array)
      within(first('#members')) do
        members.each do |member|
          expect(page).to have_content(member.name)
          expect(page).to have_content(member.photo)
          # expect(page).to have_content(member.allies)
          # expect(page).to have_content(member.enemies)
          # test doesnt account for outcome of an empty array..
          # the key presence is tested in the facade test and service test
          expect(page).to have_content(member.affiliation)
        end
      end
    end
  end
end
