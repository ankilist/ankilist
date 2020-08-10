# frozen_string_literal: true

class UploadsController < ApplicationController
  def index; end

  def create
    render json: {}, status: 200
  end
end
