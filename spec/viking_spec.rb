# Your code here
require 'viking'

describe Viking do
  let(:viking){Viking.new}

  describe "#initialize" do
    it "passes a name to a new viking in name attr" do
      steve = Viking.new("Steve")
      expect(steve.name).to eq("Steve")
    end

    it "passes a health attribute to a new viking" do
      steve = Viking.new("Steve", health = 50)
      expect(steve.health).to eq(50)
    end

    it "has a health that cannot be overwritten" #do
    #   steve = Viking.new(health = 50)
    #   expect(steve).to respond_to(:health)
    # end

    it "has a weapon that starts out new by default"
  end
  describe "#pick_up_weapon" do
    it "sets a vikings weapon"
    it "raises an exception if applied to non-weapon object"
    it "replaces existing weapon"
  end
  describe "#drop weapon" do
    it "removes a weapon"
  end
  describe "#receive attack" do
    it "reduces health by specified amount"
    it "calls take_damage method"
  end
  describe "#attack" do
    it "causes the recipients health to drop"
    it "calls vikings take_damage method"
    it "runs method damage_received if no weapon"
    it "deals fist multiplier * strength damage if no weapon"
    it "deals strength * weapon damage if attacking with weapon"
    it "uses fists instead of bow if no arrows"
  end
  describe "#check_death" do
    it "raises an error if health == 0"
  end
end
