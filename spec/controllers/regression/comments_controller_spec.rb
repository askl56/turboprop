require 'rails_helper'

RSpec.describe CommentsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:post, '/tickets/1/comments').to('comments#create', {:ticket_id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_ticket) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end