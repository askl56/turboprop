require 'rails_helper'

RSpec.describe TicketsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/projects/1/tickets/new').to('tickets#new', {:project_id=>"1"}) }
  it { is_expected.to route(:post, '/projects/1/tickets').to('tickets#create', {:project_id=>"1"}) } 
  it { is_expected.to route(:patch, '/projects/1/tickets/1').to('tickets#update', {:project_id=>"1", :id=>"1"}) } 
  it { is_expected.to route(:get, '/projects/1/tickets/1').to('tickets#show', {:project_id=>"1", :id=>"1"}) }
  it { is_expected.to route(:get, '/projects/1/tickets/1/edit').to('tickets#edit', {:project_id=>"1", :id=>"1"}) }
  it { is_expected.to route(:delete, '/projects/1/tickets/1').to('tickets#destroy', {:project_id=>"1", :id=>"1"}) } 
  it { is_expected.to route(:get, '/projects/1/tickets/search').to('tickets#search', {:project_id=>"1"}) }
  it { is_expected.to route(:post, '/projects/1/tickets/1/watch').to('tickets#watch', {:project_id=>"1", :id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_project) }
  it { is_expected.to use_before_filter(:set_ticket) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end