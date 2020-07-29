require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    task = FactoryBot.build(:task)
    expect(task.valid?).to be_truthy
  end
end
