module ProjectsHelper
  def color_class(status)
    case status
    when 'active'
      :green
    when 'completed'
      :blue
    when 'on_hold'
      :red
    when 'archived'
      :gray
    end
  end
end
