require 'rails_helper'

RSpec.describe Admin::ApplicationController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/admin').to('admin/application#index', {}) }
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:authorize_admin!) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end