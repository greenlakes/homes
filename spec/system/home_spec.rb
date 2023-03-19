# frozen_string_literal: true

require 'rails_helper'

describe 'Home page', type: :system do

  describe 'viewing content', js: true do
    it 'displays the projects and allows to add a new one' do
      visit root_path

      expect(page).to have_text('Home')

      within('nav') do
        expect(page).to have_css('a.bg-green-100', text: 'Log in')
        expect(page).to have_css('a.bg-blue-100', text: 'Sign up')
      end

      within('nav') do
        click_on 'Sign up'
      end

      expect(page).to have_css('input#user_email')
      expect(page).to have_css('input#user_password')
      expect(page).to have_css('input#user_password_confirmation')
      expect(page).to have_css('a', text: 'Sign up')

      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'Password1!'
      fill_in 'user_password_confirmation', with: 'Password1!'

      within('.actions') do
        click_on 'Sign up'
      end

      expect(page).to have_text('Home')

      within('nav') do
        expect(page).to have_css('a.bg-red-100', text: 'Log out')
        expect(page).to have_css('a.bg-blue-100', text: 'Projects List')
      end

      expect(User.count).to eq(1)
      expect(User.first.email).to eq('user@example.com')
    end
  end
end
