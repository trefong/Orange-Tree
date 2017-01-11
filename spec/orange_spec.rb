require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do
  let(:tree) { OrangeTree.new(12, 15, 150)}
  let(:young_tree) { OrangeTree.new(2, 10, 0)}
  let(:old_tree) { OrangeTree.new(101, 10, 0)}

  #You'll need to switch `describe` to `describe` when you're ready
  # to implement each set of tests.

  describe "#age" do
    it "has an age" do
      expect(tree.age).to eq 12
    end
  end

  describe "#height" do
    it "has a height" do
      expect(tree.height).to eq 15
    end
  end


  describe "#pass_growing_season" do
    it "should change the age" do
      # This should be more explicit. How much should the tree age by?
      # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
      expect {tree.pass_growing_season}.to change {tree.age}.to 13
    end

    it "should make the tree grow" do
      #This should be more explicit. How much should the tree grow?
      expect {tree.pass_growing_season}.to change{tree.height}.to 17.5
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce oranges" do
        tree.pass_growing_season
        expect(tree.has_oranges?).to eq true
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      expect(tree.mature?).to eq true
    end

    it "returns false if tree is not old enough to bear fruit" do
      expect(young_tree.mature?).to eq false
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      expect(old_tree.dead?).to eq true
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      expect(tree.has_oranges?).to eq true
    end

    it "should return false if the tree has no oranges" do
      expect(young_tree.has_oranges?).to eq false
    end
  end

  describe "#pick_an_orange" do
    it "should return an orange from the tree" do
      expect(tree.pick_an_orange.class).to eq Orange
    end

    it "the returned orange should no longer be on the tree" do
      orange = tree.pick_an_orange
      expect(tree.oranges.include?(orange)).to eq false
    end

    it "should raise an error if the tree has no oranges" do
      expect {young_tree.pick_an_orange}.to raise_error(OrangeTree::NoOrangesError)
    end
  end
end
