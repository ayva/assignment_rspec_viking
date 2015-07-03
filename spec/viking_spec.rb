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

    it "has a health that cannot be overwritten" do
      expect(viking).not_to respond_to(:health=)
     end

    it "has a weapon that starts out nil by default" do
      expect(viking.weapon.nil?).to eq(true)
    end

  end

  describe "#pick_up_weapon" do

    it "sets a vikings weapon" do
      #weapon=instance_double("weapon", :is_a? => true)
      weapon=double( :is_a? => true)
      expect(viking.pick_up_weapon(weapon)).to eq(weapon)
    end

    it "raises an exception if applied to non-weapon object" do
      array=Array.new
      expect{viking.pick_up_weapon(array)}.to raise_error(RuntimeError)
    end

    it "replaces existing weapon" do
      axe = double( :is_a? => true)
      sword = double( :is_a? => true)
      steve = Viking.new("Steve", weapon = axe)
      expect(steve.pick_up_weapon(sword)).not_to eq(axe)
    end

  end

  describe "#drop weapon" do

    it "removes a weapon" do
      steve = Viking.new(weapon = "axe")
      expect(steve.drop_weapon).to be_nil
    end
  end

  describe "#receive attack" do

    it "reduces health by specified amount" do
      steve = Viking.new("Steve")
      damage_dealt = 25
      steve.receive_attack(damage_dealt)
      expect(steve.health).to eq(75)
    end

    it "calls take_damage method" do
      steve = Viking.new("Steve")
      expect(steve).to receive(:take_damage)
      steve.receive_attack(50)
    end

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
