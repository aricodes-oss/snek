# frozen_string_literal: true

require "snek"

GRID_WIDTH = 10
GRID_HEIGHT = 10

RSpec.describe Snek::Grid do
  describe ".initialize" do
    let(:grid) do
      described_class.new(width: GRID_WIDTH, height: GRID_HEIGHT)
    end

    it "accepts a width" do
      expect(grid.width).to eq(GRID_WIDTH)
    end

    it "accepts a height" do
      expect(grid.height).to eq(GRID_WIDTH)
    end
  end
end
