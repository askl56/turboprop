require 'rails_helper'

RSpec.describe Admin::StatesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/admin/states').to('admin/states#index', {}) }
  it { should route(:get, '/admin/states/new').to('admin/states#new', {}) }
  it { should route(:post, '/admin/states').to('admin/states#create', {}) } 
  it { should route(:get, '/admin/states/1/make_default').to('admin/states#make_default', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:authorize_admin!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end