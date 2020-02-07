# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    def undefined_route
      routing_error
    end

    protected

    def routing_error
      render json: { errors: [ message: "Requested route not found" ] }, status: 404
    end
  end
end
