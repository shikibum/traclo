# frozen_string_literal: true

class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
    if params[:continent].present?
      @costumes = @costumes.where(continent: params[:continent])
    end
    if params[:culture_or_country].present?
      @costumes = @costumes
                    .where(country_japanese: params[:culture_or_country])
                    .or(Costume.where(culture_japanese: params[:culture_or_country]))
    end
  end

  def show
  end
end
