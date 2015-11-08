require 'rails_helper'

RSpec.describe Comment, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :ticket }
  it { is_expected.to belong_to :author }
  it { is_expected.to belong_to :state }
  it { is_expected.to belong_to :previous_state }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :text }
  it { is_expected.to have_db_column :ticket_id }
  it { is_expected.to have_db_column :author_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :state_id }
  it { is_expected.to have_db_column :previous_state_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["ticket_id"] }
  it { is_expected.to have_db_index ["previous_state_id"] }
  it { is_expected.to have_db_index ["author_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :text }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end