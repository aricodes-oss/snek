# frozen_string_literal: true

module Snek::Entities
  class Snake < Base
    attr_accessor :direction

    def initialize(direction: UP, **args)
      super
      @direction = direction
    end

    def turn(direction)
      @direction = direction if can_turn_to(direction)
    end

    private

    def can_turn_to(direction)
      direction.map(&:abs) != @direction.map(&:abs)
    end
  end
end
