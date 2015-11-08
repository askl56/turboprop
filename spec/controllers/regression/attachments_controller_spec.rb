require 'rails_helper'

RSpec.describe AttachmentsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/attachments/new').to('attachments#new', {}) }
  it { should route(:get, '/attachments/1').to('attachments#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_authorized) }
  it { should use_after_filter(:verify_policy_scoped) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end