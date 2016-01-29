require 'rails_helper'

RSpec.describe API::TicketsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/api/projects/1/tickets/1').to('api/tickets#show', {:project_id=>"1", :id=>"1"}) }
  it { is_expected.to route(:post, '/api/projects/1/tickets').to('api/tickets#create', {:project_id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:authenticate_user) }
  it { is_expected.to use_before_filter(:set_project) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end