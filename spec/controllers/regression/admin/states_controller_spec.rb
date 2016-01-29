require 'rails_helper'

RSpec.describe Admin::StatesController, regressor: true do
  # === Routes (REST) ===
  it { is_expected.to route(:get, '/admin/states').to('admin/states#index', {}) }
  it { is_expected.to route(:get, '/admin/states/new').to('admin/states#new', {}) }
  it { is_expected.to route(:post, '/admin/states').to('admin/states#create', {}) } 
  it { is_expected.to route(:get, '/admin/states/1/make_default').to('admin/states#make_default', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { is_expected.to use_before_filter(:verify_authenticity_token) }
  it { is_expected.to use_before_filter(:authorize_admin!) }
  # === Callbacks (After) ===
  it { is_expected.to use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end