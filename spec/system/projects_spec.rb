# frozen_string_literal: true

require 'rails_helper'

describe 'Projects', type: :system do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }
  let(:comment) { create(:comment) }


  before(:example) do
    sign_in user
    visit projects_path
  end

  describe 'viewing projects list', js: true do
    it 'displays all projects and allows to add a new one' do
      expect(page).to have_text('Projects List')
      expect(page).to have_css('#projects')

      within('#projects') do
        expect(page).to have_text("#{project.name}")
        expect(page).to have_css('.bg-green-100', text: 'Active')
      end

      expect(page).to have_css('a.bg-blue-600', text: 'New project')

      click_on 'New project'

      expect(page).to have_css('input#project_name')
      expect(page).to have_css('#project_status')
      expect(page).to have_css('input[type=submit].bg-blue-600')
      expect(page).to have_css('a.bg-gray-100', text: 'Back')

      fill_in 'Name', with: 'Second project'
      select 'On hold', from: 'project_status'
      find('input[type=submit].bg-blue-600').click

      within('#projects') do
        expect(page).to have_text('Second project')
        expect(page).to have_css('.bg-red-100', text: 'On hold')
      end

      expect(Project.count).to eq(2)
    end

    it 'displays show button and allows view project details and comments' do
      within("#project_#{project.id}") do
        expect(page).to have_css('a.bg-gray-100', text: 'Show')
      end

      find('a.bg-gray-100', text: 'Show', match: :first).click

      within('#edit_project') do
        expect(page).to have_text('Project details')
        expect(page).to have_text("#{project.name}")
        expect(page).to have_css('.bg-green-100', text: 'Active')
      end

      expect(page).to have_text('Project details')
      expect(page).to have_css('#comments')
      expect(page).to have_css('a.bg-blue-600', text: 'New comment')

      click_on 'New comment'

      expect(page).to have_css('h2', text: 'New comment')
      expect(page).to have_css('textarea#comment_content')
      expect(page).to have_css('select#comment_project_attributes_status')
      expect(page).to have_css('input[type=submit].bg-blue-600')
      expect(page).to have_css('a.bg-gray-100', text: 'Back')

      within('#comment_project_attributes_status') do
        expect(page).to have_text('On hold')
      end

      fill_in 'Content', with: 'First comment'
      select 'Completed', from: 'comment_project_attributes_status'
      find('input[type=submit].bg-blue-600').click

      within('#comments') do
        expect(page).to have_text('First comment')
        expect(page).to have_text("#{user.email}")
        expect(page).to have_text('Edit comment')
      end

      within('#project_details') do
        expect(page).to have_text("#{project.name}")
        expect(page).to have_css('.bg-blue-100', text: 'completed')
      end

    end
  end
end
