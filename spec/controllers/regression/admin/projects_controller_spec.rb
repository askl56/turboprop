require 'rails_helper'

RSpec.describe Admin::ProjectsController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/admin/projects/new').to('admin/projects#new', {}) }
  it { is_expected.to route(:post, '/admin/projects').to('admin/projects#create', {}) } 
  it { is_expected.to route(:delete, '/admin/projects/1').to('admin/projects#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:authorize_admin!) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end