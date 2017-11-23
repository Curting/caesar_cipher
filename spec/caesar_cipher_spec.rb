require "caesar_cipher"

describe "#caesar_cipher" do
  
  context "given an empty string" do
    it "returns an empty string" do
      expect(caesar_cipher("", 0)).to eql("")
    end
  end

  context "given a string with no shift" do
    it "returns a string with no shift" do
      expect(caesar_cipher("What a string", 0)).to eql("What a string")
    end
  end

  context "when given a string and a shift number" do
    it "shifts each letter correctly" do
      expect(caesar_cipher("what a string", 5)).to eql("bmfy f xywnsl")
    end

    it "wraps around and goes from z to a" do
      expect(caesar_cipher("your zebra ate my zucchini", 1)).to eql("zpvs afcsb buf nz avddijoj")
    end

    it "keeps the case of the letters" do
      expect(caesar_cipher("tHiS is A Test", 3)).to eql("wKlV lv D Whvw")
    end

    it "ignores symbols" do
      expect(caesar_cipher("this.works like, when ! you....dream? o.k.", 3)).to eql("wklv.zrunv olnh, zkhq ! brx....guhdp? r.n.")
    end
  end
end