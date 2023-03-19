# frozen_string_literal: true

# This is button component. There is primary button type and outlined with different css classes.
class ButtonComponent < ApplicationComponent
  attr_accessor :type, :options, :data_options, :button_type

  PRIMARY_CLASSES = %w[
    disabled:bg-teal-200
    focus:ring-4
    focus:bg-teal-600
    hover:bg-teal-900
    bg-teal-600
    border
    border-teal-600
    text-white
  ].freeze
  OUTLINE_CLASSES = %w[
    hover:bg-cyan-100
    focus:bg-gray-200
    disabled:bg-gray-100
    bg-white
    border
    border-teal-600
    text-white
  ].freeze
  DISABLED_CLASSES = %w[
    disabled:opacity-50
    disabled:cursor-not-allowed
    disabled:shadow-none
  ].freeze

  BASE_CLASSES = %w[
    border-solid
    hover:shadow
    inline-flex
    items-center
    gap-2
    cursor-pointer
    rounded-lg
    transition
    duration-200
    text-center
    px-4
    py-2
    whitespace-nowrap
  ].freeze

  BUTTON_TYPE_MAPPINGS = {
    primary: PRIMARY_CLASSES,
    disabled: DISABLED_CLASSES,
    outline: OUTLINE_CLASSES
  }.freeze

  def initialize(type: :primary, button_type: 'button', **options)
    super

    @type = type
    @options = options
    @button_type = button_type
    @data_options = options.delete(:data) || {}
  end

  def classes
    (BUTTON_TYPE_MAPPINGS[type] + BASE_CLASSES).join(' ')
  end
end
