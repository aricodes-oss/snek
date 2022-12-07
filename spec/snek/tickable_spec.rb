# frozen_string_literal: true

require "snek"
require "rspec"

RSpec.describe Snek::Tickable do
  describe "ticking" do
    let(:node) do
      described_class.new
    end

    it "has a tick method" do
      expect(node).to respond_to(:tick)
    end

    it "tracks its lifespan" do
      previous = node.lifespan
      node.tick
      expect(node.lifespan).to be == previous + 1
    end
  end

  describe "children" do
    before do
      child = instance_spy(described_class)
      parent = described_class.new

      parent.children << child

      @parent = parent
      @child = child
    end

    it "calls clear on its children" do
      @parent.clear!
      expect(@child).to have_received(:clear!)
    end

    it "flushes children on clear" do
      @parent.clear!
      expect(@parent.children.length).to be 0
    end

    it "ticks its children" do
      @parent.tick
      expect(@child).to have_received(:tick)
    end
  end
end
