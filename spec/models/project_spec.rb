# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { create(:project) }

  describe 'associations' do
    it { is_expected.to(have_many(:comments)) }
  end

  describe 'validations' do
    it { is_expected.to(validate_presence_of(:name)) }
  end

end
