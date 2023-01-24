# frozen_string_literal: true

module Snek::Entities
  class Base
    attr_accessor :children, :x, :y

    def initialize(children: [], position: [0, 0])
      @children = children
      @x = position[0]
      @y = position[1]
    end

    def tick
      @children.map(&:tick)
    end

    def position
      [@x, @y]
    end

    def occupied_tiles
      position + @children.map(&:position)
    end

    def include?(point)
      occupied_tiles.include?(point)
    end
    alias_method :collides?, :include?

    def length
      @children.length + 1
    end
  end
end
