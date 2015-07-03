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
      my_double=double("double", :size => 2)
      expect(warmup.double_size(my_double)).to eq(4)
    end
  end

  describe "calls_some_methods" do
    it "receives the upcase method" do
      str = "this is a string"
      expect(str).to receive(:upcase!)
      warmup.calls_some_methods(str)
    end
    it "receives the reverse method" do
      str = "this is a string"
      expect(str).to receive(:reverse!)
      warmup.calls_some_methods(str)
    end
    it "changes the input string" do
      str = "this is a string"
      str_test = "this is a string"
      warmup.calls_some_methods(str)
      expect(str).to eq(str_test.upcase.reverse)
    end
    it "returns a different string than passed" do
      str = "this is a string"
      expect(warmup.calls_some_methods(str)).not_to eq(str)
    end
  end

end