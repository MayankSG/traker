require 'spec_helper'
require './tracker'

RSpec.describe Tracker do
  context "For Gso" do

    it "removes all white spaces from tracking number" do
      tracking_number_with_spaces = " 7708 5071 017342  912945 "
      expect(Tracker.new(Gso, tracking_number_with_spaces).link).to eq("https://www.gso.com/Trackshipment?TrackingNumbers=77085071017342912945")
    end

    it "returns tracking url for valid tracking number" do
      valid_tracking_number = "77085071017342912945"
      expect(Tracker.new(Gso, valid_tracking_number).link).to eq("https://www.gso.com/Trackshipment?TrackingNumbers=77085071017342912945")
    end

    it "returns nil for invalid tracking numbers" do
      invalid_tracking_numbers = [
          "70151520000337683171",
          "1z6297940372553078",
          "9400111899223523321287",
          "728803523361",
          "92748999984327000003259997",
          "728803517241",
          "950512035600000072",
          "728803526452" ,
          "040250075205307"
      ]
      invalid_tracking_numbers.each do |tracking_number| 
        expect(Tracker.new(Gso, tracking_number).link).to be_nil
      end
    end

  end
end