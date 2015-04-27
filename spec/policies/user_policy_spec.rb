require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy do

  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
    it "allows administrators access to all users"
  end

  permissions :show? do
    it "allows allows administrators to see all users"
    it "allows instructors to see their own users"
  end

  permissions :create? do
    it "allows administrators to create users"
  end

  permissions :update? do
    it "allows administrators to update users"
    it "allows users to update themselves"
  end

  permissions :destroy? do
    it "allows administrators to destroy users"
  end
end
