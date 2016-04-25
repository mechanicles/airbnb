module SharedOfficeSpacesHelper

  def seating_periods
    SharedOfficeSpace::SEATING_PERIOD.map { |period| [period, period] }
  end

end
