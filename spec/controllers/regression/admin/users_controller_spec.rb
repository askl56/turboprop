require 'rails_helper'

RSpec.describe Admin::UsersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/admin/users').to('admin/users#index', {}) }
  it { should route(:get, '/admin/users/1').to('admin/users#show', {:id=>"1"}) }
  it { should route(:get, '/admin/users/1/edit').to('admin/users#edit', {:id=>"1"}) }
  it { should route(:get, '/admin/users/new').to('admin/users#new', {}) }
  it { should route(:post, '/admin/users').to('admin/users#create', {}) } 
  it { should route(:patch, '/admin/users/1').to('admin/users#update', {:id=>"1"}) } 
  it { should route(:patch, '/admin/users/1/archive').to('admin/users#archive', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:authorize_admin!) }
  it { should use_before_filter(:set_user) }
  it { should use_before_filter(:set_projects) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end