# frozen_string_literal: true

class BadgeComponent < ApplicationComponent
  attr_reader :status

  COLOR_CLASSES = {
    blue: { background_color: 'bg-blue-100', text_color: 'text-blue-800' },
    red: { background_color: 'bg-red-100', text_color: 'text-red-800' },
    green: { background_color: 'bg-green-100', text_color: 'text-green-800' },
    gray: { background_color: 'bg-gray-100', text_color: 'text-gray-800' }
  }.freeze

  BASE_CLASSES = 'inline-flex items-center px-2 py-1 rounded-md text-sm font-medium'

  def initialize(status: :green)
    super

    @status = status
  end

  private

  def color_class
    COLOR_CLASSES[status]
  end

  def base_classes
    BASE_CLASSES
  end

end
