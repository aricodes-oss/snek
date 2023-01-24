# frozen_string_literal: true

require "snek"
require "json"

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

  it "can be serialized to json" do
    expect(described_class.new).to respond_to(:to_json)
  end

  it "can be deserialized from json" do
    expect(described_class.new).to respond_to(:from_json!)
  end
end
