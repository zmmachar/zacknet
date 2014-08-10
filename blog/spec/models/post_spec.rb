require 'rails_helper'

RSpec.describe Post, :type => :model do
  before do
    @post = Post.new(title: "Buttz")
  end

  subject { @post }

  it { should respond_to{:title} }
  it { should be_valid }

  describe "when title is not present" do
    before { @post.title = " "}
    it { should_not be_valid }
  end

  describe "when title is already taken" do
    before do
      post_with_same_name = @post.dup
      post_with_same_name.name = @post.name.upcase
      post_with_same_name.save
    end

    it {should_not be_valid}
end
