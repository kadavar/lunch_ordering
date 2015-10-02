require 'rails_helper'

describe Role do
  before { @roles=Role.new(role: "admin") }
  subject { @roles }

  describe "describe Role" do
    before { @roles.save }
    it { should respond_to(:role) }
  end

  describe "Role is not blank" do
    it { expect(@roles.role).not_to be_blank }
  end

  describe "role already exist" do
    before do
      thesamerole=@roles.dup
      thesamerole.save
    end

    it { should_not be_valid }
  end

end

