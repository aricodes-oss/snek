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

    def move
      prev_position = position
      next_position = (Matrix[position] + Matrix[@direction]).to_a.first

      @position = next_position

      @children.each do |child|
        child_position = child.position
        child.position = prev_position

        prev_position = child_position
      end
    end

    private

    def can_turn_to(direction)
      direction.map(&:abs) != @direction.map(&:abs)
    end
  end
end
