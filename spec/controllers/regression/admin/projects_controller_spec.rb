require 'rails_helper'

RSpec.describe Admin::ProjectsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/admin/projects/new').to('admin/projects#new', {}) }
  it { should route(:post, '/admin/projects').to('admin/projects#create', {}) } 
  it { should route(:delete, '/admin/projects/1').to('admin/projects#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:authorize_admin!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end