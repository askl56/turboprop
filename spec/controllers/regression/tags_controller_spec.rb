require 'rails_helper'

RSpec.describe TagsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:delete, '/tickets/1/tags/1/remove').to('tags#remove', {:ticket_id=>"1", :id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end