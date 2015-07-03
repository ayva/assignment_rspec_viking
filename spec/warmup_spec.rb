require 'warmup'

describe Warmup do
  let(:warmup){Warmup.new}

  describe "#gets_shout" do
    it 'gets input and returns upcase' do
      allow(warmup).to  receive(:gets).and_return("Hello")
      expect(warmup.gets_shout).to eq("HELLO")
    end
  end

    describe "#double_size" do
    it 'returns doubled size of an array' do
      my_double=double("double_size", :array => [1,1])
      expect(my_double).to receive(:array).and_return(array.size * 2)
      #expect(warmup.double_size([2,2,2])).to eq(6)
    end
  end

end