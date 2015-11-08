require 'rails_helper'

RSpec.describe ProjectsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/').to('projects#index', {}) }
  it { should route(:get, '/projects/1').to('projects#show', {:id=>"1"}) }
  it { should route(:get, '/projects/1/edit').to('projects#edit', {:id=>"1"}) }
  it { should route(:patch, '/projects/1').to('projects#update', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_project) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_authorized) }
  it { should use_after_filter(:verify_policy_scoped) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end