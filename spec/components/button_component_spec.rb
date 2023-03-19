# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ButtonComponent, type: :component do
  let(:content) { 'Button text' }

  context 'when the button type is "primary"' do
    let(:type) { :primary }

    it 'renders a primary button' do
      render_inline(described_class.new(type: type)) { content }

      expect(page).to have_css('button.border.text-white')
      expect(page).to have_text(content)
    end
  end

  context 'when the button type is "outline"' do
    let(:type) { :outline }

    it 'renders an outline button' do
      render_inline(described_class.new(type: type)) { content }

      expect(page).to have_css('button.bg-white')
      expect(page).to have_text(content)
    end
  end
end
