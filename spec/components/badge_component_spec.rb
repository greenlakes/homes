# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BadgeComponent, type: :component do
  let(:content) { 'Badge content' }

  it 'renders badge' do
    render_inline(described_class.new) { content }

    expect(page).to have_text(content)
  end
end
