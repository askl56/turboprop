require 'rails_helper'

RSpec.describe TagsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:delete, '/tickets/1/tags/1/remove').to('tags#remove', {:ticket_id=>"1", :id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_authorized) }
  it { should use_after_filter(:verify_policy_scoped) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end