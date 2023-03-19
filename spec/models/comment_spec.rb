# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { create(:comment) }

  describe 'associations' do
    it { is_expected.to(belong_to(:user)) }
    it { is_expected.to(belong_to(:project)) }
  end

  describe 'validations' do
    it { is_expected.to(validate_presence_of(:content)) }
  end
end

