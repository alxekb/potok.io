# frozen_string_literal: true

class AbstractService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
