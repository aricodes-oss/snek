# frozen_string_literal: true

module Snek
  class Error < StandardError; end

  module Directions
    UP = [0, -1].freeze
    DOWN = [0, 1].freeze
    LEFT = [-1, 0].freeze
    RIGHT = [1, 0].freeze
  end
end

require_relative "snek/version"
require_relative "snek/entities/entities"
