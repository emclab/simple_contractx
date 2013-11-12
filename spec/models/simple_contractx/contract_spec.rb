require 'spec_helper'

module SimpleContractx
  describe Contract do
    it "should be OK" do
      p = FactoryGirl.build(:simple_contractx_contract)
      p.should be_valid
    end
    
    it "should reject nil contract total" do
      p = FactoryGirl.build(:simple_contractx_contract, :contract_total => nil)
      p.should_not be_valid
    end
    
    it "should reject 0 contract total" do
      p = FactoryGirl.build(:simple_contractx_contract, :contract_total => 0)
      p.should_not be_valid
    end
    
    it "should reject nil project_id" do
      p = FactoryGirl.build(:simple_contractx_contract, :project_id => nil)
      p.should_not be_valid
    end
    
    it "should reject 0 project_id" do
      p = FactoryGirl.build(:simple_contractx_contract, :project_id => 0)
      p.should_not be_valid
    end
    
    it "should take 0 payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => 0)
      p.should be_valid
    end
    
    it "should take no char payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => "a")
      p.should_not be_valid
    end
    
    it "should take no integer payment_term" do
      p = FactoryGirl.build(:simple_contractx_contract, :payment_term => 0.6)
      p.should_not be_valid
    end
    
  end
end
