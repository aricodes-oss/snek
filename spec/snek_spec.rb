# frozen_string_literal: true

require_relative "snek/entities/entities_spec"

RSpec.describe Snek do
  it "has a version number" do
    expect(Snek::VERSION).not_to be_nil
  end
end
