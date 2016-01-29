require "rails_helper"

RSpec.describe CommentPolicy do

  context "permissions" do

    subject { CommentPolicy.new(user, comment) }

    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) { FactoryGirl.create(:ticket, project: project) }
    let(:comment) { FactoryGirl.create(:comment, ticket: ticket) }

    context "for anonymous users" do

      let(:user) { nil }
      it { is_expected.not_to permit_action :create }

    end

    context "for viewers of the project" do

      before { assign_role!(user, :viewer, project) }
      it { is_expected.not_to permit_action :create }

    end

    context "for editors of the project" do

      before { assign_role!(user, :editor, project) }
      it { is_expected.to permit_action :create }

    end

    context "for managers of the project" do

      before { assign_role!(user, :manager, project) }
      it { is_expected.to permit_action :create }

    end

    context "for managers of other projects" do

      before do
        assign_role!(user, :manager, FactoryGirl.create(:project))
      end

      it { is_expected.not_to permit_action :create }
    end

    context "for administrators" do

      let(:user) { FactoryGirl.create :user, :admin }
      it { is_expected.to permit_action :create }

    end
  end
end
