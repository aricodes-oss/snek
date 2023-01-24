# frozen_string_literal: true

require "json"

module Snek::Entities
  # Base entity class for all others to inherit from
  class Base
    attr_accessor :children, :position

    def initialize(children: [], position: [0, 0])
      @children = children
      @position = position
    end

    def tick
      @children.map(&:tick)
    end

    def x
      @position[0]
    end

    def y
      @position[1]
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

    def to_json(*_args)
      hash = {}
      instance_variables.each do |var|
        hash[var] = instance_variable_get var
      end
      hash.to_json
    end

    def from_json!(string)
      JSON.parse(string).each do |var, val|
        instance_variable_set var, val
      end
    end
  end
end
