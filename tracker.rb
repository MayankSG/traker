require './carriers/gso'

class Tracker

  def initialize(carrier, number)
    @carrier_obj = carrier.new( number )
  end

  # return tracker link or nil
  def link
    if @carrier_obj.valid?
      @carrier_obj.track_link
    else
      nil
    end
  end

end