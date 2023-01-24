# frozen_string_literal: true

require "snek"

RSpec.describe Snek::Entities::Base do
  it "accepts children" do
    node = described_class.new(children: [1, 2, 3])

    expect(node.children.length).to eq(3)
  end

  it "accepts a position" do
    pos = [rand(1024), rand(1024)]
    node = described_class.new(position: pos)

    expect(node.position).to eq(pos)
  end

  it "detects collision" do
    pos = [rand(1024), rand(1024)]
    node = described_class.new(children: [described_class.new(position: pos)])

    expect(node.collides?(pos)).to be true
  end
end
