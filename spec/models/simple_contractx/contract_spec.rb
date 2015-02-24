require 'rails_helper'

module SimpleContractx
  RSpec.describe Contract, type: :model do
    it "should be OK" do
      p = FactoryGirl.build(:simple_contractx_contract)
      expect(p).to be_valid
    end
    
    it "should reject nil contract total" do
      p = FactoryGirl.build(:simple_contractx_contract, :contract_total => nil)
      expect(p).not_to be_valid
    end
    
    it "should reject 0 contract total" do
      p = FactoryGirl.build(:simple_contractx_contract, :contract_total => 0)
      expect(p).not_to be_valid
    end
    
    it "should reject nil project_id" do
      p = FactoryGirl.build(:simple_contractx_contract, :project_id => nil)
      expect(p).not_to be_valid
    end
    
    it "should reject 0 project_id" do
      p = FactoryGirl.build(:simple_contractx_contract, :project_id => 0)
      expect(p).not_to be_valid
    end
    
    it "should reject non digit executed total" do
      p = FactoryGirl.build(:simple_contractx_contract, :executed_contract_total => 'nil')
      expect(p).not_to be_valid
    end
    
    it "should take 0 payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => 0)
      expect(p).to be_valid
    end
    
    it "should take no char payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => "a")
      expect(p).not_to be_valid
    end
    
    it "should take no integer payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => 0.6)
      expect(p).not_to be_valid
    end
    
  end
end
