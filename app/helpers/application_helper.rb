module ApplicationHelper
  def format_duration(duration_unit, duration)
    return duration_unit.pluralize if duration > 1
    duration_unit
  end

  # the timezone probably lives in the users or settings table so it is configurable
  def user_tz
    'Europe/Athens'
  end
end
