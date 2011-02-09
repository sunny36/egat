require 'spec_helper'

describe VisualInspectionsController do
  describe "POST create" do
    it "redirects to VisualInspections search" do
      post :create
      response.should redirect_to(:action => "search")
    end
  end
end
