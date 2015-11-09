require 'rails_helper'

RSpec.describe Ticket, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :project }
  it { is_expected.to belong_to :author }
  it { is_expected.to belong_to :state }
  
  it { is_expected.to have_many :attachments }
  it { is_expected.to have_many :comments }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :attachments }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :project_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :author_id }
  it { is_expected.to have_db_column :state_id }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["state_id"] }
  it { is_expected.to have_db_index ["project_id"] }
  it { is_expected.to have_db_index ["author_id"] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(10)).for :description }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(9)).for :description }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end