require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user_deal) { FactoryGirl.create(:user_deal) }

  it "Should have 4 deal" do
    expect( user_deal.incomes.size ).to eq( 4 )
    expect( user_deal.outgos.size ).to eq( 4 )
  end
  it "Should not be valid" do
    FactoryGirl.create(:user, email: 'l.toto@toto.com')
    user = FactoryGirl.build(:user, email: 'l.toto@toto.com')
    expect(user).to_not be_valid
  end
end
