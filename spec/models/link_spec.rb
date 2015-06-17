require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { build(:link) }
  
  it "has valid factory" do
    expect(link).to be_valid
  end

  it "is not valid without user" do
    link.user = nil
    expect(link).not_to be_valid
  end

  it "is not valid without url" do
    link.url = ''
    expect(link).not_to be_valid
  end

  it "is not valid without title" do
    link.title = ''
    expect(link).not_to be_valid
  end
end
