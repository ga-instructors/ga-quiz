require 'rails_helper'
require 'pundit/rspec'

RSpec.describe GroupPolicy do

  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
    it "allows instructors to see their own groups"
    it "allows administrators to see all of the groups"
    it "hides groups from students who don't belong to them"
  end

  permissions :show? do
    it "allows instructors to see their own groups"
    it "allows administrators to see all of the groups"
  end

  permissions :create? do
    it "allows administrators to create new groups"
  end

  permissions :update? do
    it "allows instructors to update and add group members"
  end

  permissions :destroy? do
    it "allows administrators to destroy groups"
  end
end
