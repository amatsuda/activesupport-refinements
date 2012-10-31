module DateExt; end; module DateExt::Zones
require 'date'
require 'active_support/refinements/core_ext/time/zones'

refine Date do
  # Converts Date to a TimeWithZone in the current zone if <tt>Time.zone</tt> or
  # <tt>Time.zone_default</tt> is set, otherwise converts Date to a Time via
  # Date#to_time.
  def to_time_in_current_zone
    if ::Time.zone
      ::Time.zone.local(year, month, day)
    else
      to_time
    end
  end
end
end
