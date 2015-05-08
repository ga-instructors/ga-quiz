require 'rails_helper'

RSpec.describe "Groups::Regroups", type: :request do
  describe "GET /groups_regroups" do
    it "works! (now write some real specs)" do
      get groups_regroups_path
      expect(response).to have_http_status(200)
    end
  end
end
