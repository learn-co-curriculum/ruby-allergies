require 'spec_helper'
require_relative '../allergies'

describe Allergies do
  
  it 'has no allergies' do
    allergies = Allergies.new(0)
    expect([]).to match_array(allergies.list)
  end

  it "is allergic to eggs" do
    allergies = Allergies.new(1)
    expect(['eggs']).to match_array(allergies.list)
  end

  it "is allergic to peanuts" do
    allergies = Allergies.new(2)
    expect(['peanuts']).to match_array(allergies.list)
  end

  it "is allergic to strawberries" do
    allergies = Allergies.new(8)
    expect(['strawberries']).to match_array(allergies.list)
  end

  it "is allergic to eggs and peanuts" do
    allergies = Allergies.new(3)
    expect(['eggs', 'peanuts']).to match_array(allergies.list)
  end

  it "is allergic to more than eggs but not peanuts" do
    allergies = Allergies.new(5)
    expect(['eggs', 'shellfish']).to match_array(allergies.list)
  end

  it "is allergic to lots of stuff" do
    allergies = Allergies.new(248)
    expect(['strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']).to match_array(allergies.list)
  end

  it "is allergic to everything" do
    allergies = Allergies.new(255)
    expect(['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']).to match_array(allergies.list)
  end

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

  it "is not allergic to non allergen parts" do
    allergies = Allergies.new(509)
    expect(['eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']).to match_array(allergies.list)
  end

end
