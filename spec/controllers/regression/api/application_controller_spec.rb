require 'rails_helper'

RSpec.describe API::ApplicationController, regressor: true do
  # === Routes (REST) ===
  
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:authenticate_user) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end