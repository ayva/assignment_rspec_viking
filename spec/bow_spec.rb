# Your code here
require 'weapons/bow'

describe Bow do
  let(:bow){Bow.new}

  describe "#initialize" do

    it 'has a readable arrow count' do
      expect(bow.arrows.nil?).to eq(false)
      #Is that the way to check?
    end

    it 'starts with 10 arrows by default' do
      expect(bow.arrows).to eq(10)
    end

    it 'can start with specified number of arrows' do
      bow5=Bow.new(5)
      expect(bow5.arrows).to eq(5)
    end
  end
  describe "#use" do
    it 'reduces arrows by one when used' do
      bow.use
      expect(bow.arrows).to eq(9)
    end
    it 'throws an error when has 0 arrows' do
      bow0=Bow.new(0)
      expect(bow0.use).to raise 'RuntimeError'
    end

  end


end