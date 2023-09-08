require 'rails_helper'

RSpec.describe 'ATLA api call', type: :feature do
  feature 'A user can search for show data ' do
    scenario 'Fire Nation list is returned that displays show/character info' do

      visit root_path

      select 'Fire Nation', from: :nation

      click_button 'Search For Members'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Total Fire Nation Members: 97')
    end
  end
end