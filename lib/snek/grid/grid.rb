# frozen_string_literal: true

module Snek
  # Keeps track of game state with an addressable grid
  class Grid
    attr_accessor :width, :height

    def initialize(width: 1, height: 1)
      @width = width
      @height = height
    end
  end
end
