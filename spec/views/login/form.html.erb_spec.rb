# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'login/form.html.erb', type: :feature do
  describe 'login page' do
    it 'shows right content' do
      visit '/login'
      expect(page).to have_button('log in')
    end
  end
end
