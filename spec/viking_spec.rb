# Your code here
require 'viking'
require 'weapons/axe'
require 'weapons/weapon'

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
    let(:viking2){Viking.new}
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
    it "causes the recipients health to drop" do
      viking2=Viking.new
      viking.attack(viking2)
      viking.attack(viking2)
      expect(viking2.health).to eq(95)
    end

    it "calls vikings take_damage method" do
      viking2=Viking.new
      expect(viking2).to receive(:take_damage)
      viking.attack(viking2)
    end

    it "runs method damage_with_fists if no weapon" do
      viking2=Viking.new

      expect(viking).to receive(:damage_with_fists).and_return(10)
      viking.attack(viking2)
    end

    it "deals fist multiplier * strength damage if no weapon" do
      viking2=Viking.new
      multiplier = Fists.new.use
      
      expect(viking2.health).to eq(100)
      viking.attack(viking2)
      expect(viking2.health).to eq(100-multiplier*viking.strength)
    end

    it "deals strength * weapon damage if attacking with weapon" do
      # axe=double("axe", :use => 1, :is_a? => true)
      axe = Axe.new
      viking2=Viking.new
      viking2.pick_up_weapon(axe)
      viking2.weapon
      viking2.attack(viking)
      expect(viking.health).to eq(100-axe.use*viking2.strength)
    end

    it "uses fists instead of bow if no arrows" do
      bow = Bow.new(0)
      viking2 = Viking.new
      viking2.pick_up_weapon(bow)
      viking2.attack(viking)
      expect(viking.health).to eq(97.5)
    end
  end

  describe "#check_death" do

    it "raises an error if health == 0" do
      viking2 = Viking.new
      viking = Viking.new("bob", 2.5)
      expect{viking2.attack(viking)}.to raise_error(RuntimeError)
    end
  end

end
