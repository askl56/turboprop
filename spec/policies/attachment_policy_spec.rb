require 'rails_helper'

describe AttachmentPolicy do

  let(:user) { User.new }

  subject { AttachmentPolicy }

  context "permissions" do

    subject { AttachmentPolicy.new(user, attachment) }

    let(:user) { FactoryGirl.build(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) { FactoryGirl.create(:ticket, project: project) }
    let(:attachment) { FactoryGirl.create(:attachment, ticket: ticket) }

    context "for anonymous users" do
      let(:user) { nil }
      it { is_expected.not_to permit_action :show }
    end

    context "for viewers of the project" do

      before { assign_role!(user, :viewer, project) }
      it { is_expected.to permit_action :show }

    end

    context "for editors of the project" do

      before { assign_role!(user, :editor, project) }
      it { is_expected.to permit_action :show }

    end

    context "for managers of the project" do

      before { assign_role!(user, :manager, project) }
      it { is_expected.to permit_action :show }

    end

    context "for managers of other projects" do

      before do
        assign_role!(user, :manager, FactoryGirl.create(:project))
      end

      it { is_expected.not_to permit_action :show }

      context "for administrators" do

        let(:user) { FactoryGirl.build :user, :admin }
        it { is_expected.to permit_action :show }

      end
    end
  end
end
