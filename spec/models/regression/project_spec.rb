require 'rails_helper'

RSpec.describe Project, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :tickets }
  it { is_expected.to have_many :roles }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :name }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end