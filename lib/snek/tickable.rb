# frozen_string_literal: true

module Snek
  # Base class for any state-tracking entity
  class Tickable
    attr_accessor :children
    attr_reader :lifespan

    def initialize(*children)
      @children = children
      @lifespan = 0
    end

    def tick
      @lifespan += 1
      @children.each(&:tick)
    end

    def clear!
      @children.each(&:clear!)
      @children = []
    end
  end
end
