require 'rails_helper'

RSpec.describe ProjectsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/').to('projects#index', {}) }
  it { is_expected.to route(:get, '/projects/1').to('projects#show', {:id=>"1"}) }
  it { is_expected.to route(:get, '/projects/1/edit').to('projects#edit', {:id=>"1"}) }
  it { is_expected.to route(:patch, '/projects/1').to('projects#update', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:set_project) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_authorized) }
  it { is_expected.to use_after_filter(:verify_policy_scoped) }
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end