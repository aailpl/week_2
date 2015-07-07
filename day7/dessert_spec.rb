require_relative "dessert"

describe Dessert do
  let(:fat_free) { Dessert.new("Fat-free cake", 130) }
  let(:fat) { Dessert.new("Fat cake", 500) }

  describe "#healthy?" do
    it "considers a dessert healthy under 200 calories" do
      expect(fat_free).to be_healthy
      expect(fat).not_to be_healthy
    end
  end

  describe "#delicious?" do
    it "considers all generic desserts as delicious" do
      expect(fat_free).to be_delicious
      expect(fat).to be_delicious
    end
  end
end

describe JellyBean do

  let(:licorice_jelly) { JellyBean.new("jelly bean", 130, "black licorice") }
  let(:fat_jelly) { JellyBean.new("jelly bean", 300, "strawberry") }

  describe "inheritance" do
    it "should only extend Dessert with #flavor and #delicious?" do
      expect(JellyBean.instance_methods(false)).to eq [:flavor, :delicious?]
    end
  end

  describe "#flavor" do
    it "has a flavor getter" do
      expect(licorice_jelly.flavor).to eq "black licorice"
    end
  end

  describe "#healthy?" do
    it "inherits #healthy? from the Dessert class" do
      expect(licorice_jelly).to be_healthy
      expect(fat_jelly).not_to be_healthy
    end
  end

  describe "#delicious?" do
    it "has its own rules for deliciousness" do
      expect(licorice_jelly).not_to be_delicious
      expect(fat_jelly).to be_delicious
    end
  end
end