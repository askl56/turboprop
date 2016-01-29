require "rails_helper"

RSpec.describe TicketPolicy do
  context "permissions" do
    subject { TicketPolicy.new(user, ticket) }

    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) { FactoryGirl.create(:ticket, project: project) }

    context "for anonymous users" do

      let(:user) { nil }

      it { is_expected.not_to permit_action :show }
      it { is_expected.not_to permit_action :create }
      it { is_expected.not_to permit_action :update }
      it { is_expected.not_to permit_action :destroy }
      it { is_expected.not_to permit_action :change_state }
      it { is_expected.not_to permit_action :tag }
    end

    context "for viewers of the project" do

      before { assign_role!(user, :viewer, project) }

      it { is_expected.to permit_action :show }
      it { is_expected.not_to permit_action :create }
      it { is_expected.not_to permit_action :update }
      it { is_expected.not_to permit_action :destroy }
      it { is_expected.not_to permit_action :change_state }
      it { is_expected.not_to permit_action :tag }
    end

    context "for editors of the project" do

      before { assign_role!(user, :editor, project) }

      it { is_expected.to permit_action :show }
      it { is_expected.to permit_action :create }
      it { is_expected.not_to permit_action :update }
      it { is_expected.not_to permit_action :destroy }
      it { is_expected.not_to permit_action :change_state }
      it { is_expected.not_to permit_action :tag }

      context "when the editor created the ticket" do
        before { ticket.author = user }

        it { is_expected.to permit_action :update }
      end
    end

    context "for managers of the project" do

      before { assign_role!(user, :manager, project) }

      it { is_expected.to permit_action :show }
      it { is_expected.to permit_action :create }
      it { is_expected.to permit_action :update }
      it { is_expected.to permit_action :destroy }
      it { is_expected.to permit_action :change_state }
      it { is_expected.to permit_action :tag }
    end

    context "for managers of other projects" do

      before do
        assign_role!(user, :manager, FactoryGirl.create(:project))
      end

      it { is_expected.not_to permit_action :show }
      it { is_expected.not_to permit_action :create }
      it { is_expected.not_to permit_action :update }
      it { is_expected.not_to permit_action :destroy }
      it { is_expected.not_to permit_action :change_state }
      it { is_expected.not_to permit_action :tag }
    end

    context "for administrators" do

      let(:user) { FactoryGirl.create :user, :admin }

      it { is_expected.to permit_action :show }
      it { is_expected.to permit_action :create }
      it { is_expected.to permit_action :update }
      it { is_expected.to permit_action :destroy }
      it { is_expected.to permit_action :change_state }
      it { is_expected.to permit_action :tag }
    end
  end
end
