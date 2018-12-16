# frozen_string_literal: true

class CostumesController < ApplicationController
  def  index
    @costumes = Costume.all
  end

  def show
  end
end
