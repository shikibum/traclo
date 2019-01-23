# frozen_string_literal: true

class AdminCostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
  end

  def fetch
  end

  def new
    @costume = Costume.initialize_by_object_id(params[:object_id])
  end
end
