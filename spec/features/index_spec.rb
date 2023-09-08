require 'rails_helper'

RSpec.describe 'ATLA api call', type: :feature do
  feature 'A user can search for show data ' do
    scenario 'Fire Nation list is returned that displays show/character info' do

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

      # within('#member)') do
      #   memebr.each do |member| 
      #     expect(page).to have_content(member.name)
      #     expect(page).to have_content(member.photo)
      #     expect(page).to have_content(member.allies)
      #     expect(page).to have_content(member.enemies)
      #     expect(page).to have_content(member.affiliation)
      #   end
      # end
    end
  end
end