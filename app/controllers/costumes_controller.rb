# frozen_string_literal: true

class CostumesController < ApplicationController
  def index
    if params[:continent].present?
      @costumes = Costume.where(continent: params[:continent])
    else
      @costumes = Costume.all
    end
  end

  def show
  end
end
