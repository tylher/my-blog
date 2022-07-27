# frozen_string_literal: true

require 'rails_helper'

<<<<<<< HEAD
RSpec.describe 'login/form.html.erb', type: :feature do
  describe 'login page' do
    it 'shows right content' do
      visit '/login'
      expect(page).to have_button('log in')
    end
  end
end
<<<<<<< HEAD
=======

=======
RSpec.describe 'login/form.html.erb', type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
end
>>>>>>> 19f002a9f651fb5f5eb91dfad5cbf258953c860e
>>>>>>> dev
