describe Allergies do

  describe "::CONSTANTS" do
    it 'has a constant, ALLERGY_LIST, that points to an array of allergies' do
      expect(Allergies::ALLERGY_LIST).to eq(["eggs", "peanuts", "shellfish", "strawberries","tomatoes", "chocolate", "pollen", "cats"])
    end
  end
  
  describe '#list' do
    it 'has no allergies' do
      expect(Allergies.new(0).list).to match_array([])
    end

    it "is allergic to eggs" do
      expect(Allergies.new(1).list).to match_array(['eggs'])
    end

    it "is allergic to peanuts" do
      expect(Allergies.new(2).list).to match_array(['peanuts'])
    end

    it "is allergic to strawberries" do
      expect(Allergies.new(8).list).to match_array(['strawberries'])
    end

    it "is allergic to eggs and peanuts" do
      expect(Allergies.new(3).list).to match_array(['eggs', 'peanuts'])
    end

    it "is allergic to more than eggs but not peanuts" do
      expect(Allergies.new(5).list).to match_array(['eggs', 'shellfish'])
    end

    it "is allergic to lots of stuff" do
      expect(Allergies.new(248).list).to match_array(['strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'])
    end

    it "is allergic to everything" do
      expect(Allergies.new(255).list).to match_array(['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'])
    end
  
    it "is not allergic to non allergen parts" do
      expect(Allergies.new(509).list).to match_array(['eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'])
    end
  end

  describe '#allergic_to?' do
    it "is not allergic to things" do
      allergies = Allergies.new(0)
      expect(allergies.allergic_to?('peanuts')).to be_falsey
      expect(allergies.allergic_to?('cats')).to be_falsey
      expect(allergies.allergic_to?('strawberries')).to be_falsey
    end

    it "is allergic to eggs" do
      allergies = Allergies.new(1)
      expect(allergies.allergic_to?('eggs')).to be_truthy
    end

    it "allergic to eggs and other stuff" do
      allergies = Allergies.new(5)
      expect(allergies.allergic_to?('eggs')).to be_truthy
    end
  end

end
