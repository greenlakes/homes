# frozen_string_literal: true

# In future, this is where we would introduce Turbo and other shared component helpers
class ApplicationComponent < ViewComponent::Base
  include Turbo::StreamsHelper
  include Turbo::FramesHelper

  def call; end
end