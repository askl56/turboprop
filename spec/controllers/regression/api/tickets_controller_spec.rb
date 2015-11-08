require 'rails_helper'

RSpec.describe API::TicketsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/api/projects/1/tickets/1').to('api/tickets#show', {:project_id=>"1", :id=>"1"}) }
  it { should route(:post, '/api/projects/1/tickets').to('api/tickets#create', {:project_id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:authenticate_user) }
  it { should use_before_filter(:set_project) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_authorized) }
  it { should use_after_filter(:verify_policy_scoped) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end