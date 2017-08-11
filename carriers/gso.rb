class Gso

  def initialize(number)
    @tracking_number = filter_number(number)
  end

  def track_link
    "https://www.gso.com/Trackshipment?TrackingNumbers=#{@tracking_number}"
  end

  # check validity of tracking number
  def valid?
    @tracking_number.scan(/770850[0-9]{3}173[0-9]{8}/).include? @tracking_number
  end

  private

  # remove white space from tracking number
  def filter_number(number)
    number.gsub(/\s+/, "")
  end

end