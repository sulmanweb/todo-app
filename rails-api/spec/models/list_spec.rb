require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a valid factory" do
    list = FactoryBot.build(:list)
    expect(list.valid?).to be_truthy
  end
end
