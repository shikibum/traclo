# frozen_string_literal: true

class AdminCostumesController < ApplicationController
  def index
    @costumes = Costume.where.not(title_japanese: nil)
    if params[:continent].present?
      @costumes = @costumes.where(continent: params[:continent])
    end
    if params[:culture_or_country].present?
      @costumes = @costumes
                    .where(country_japanese: params[:culture_or_country])
                    .or(Costume.where(culture_japanese: params[:culture_or_country]))
    end
    if params[:no_title_japanese].present?
      @costumes = Costume.where(title_japanese: nil)
    end
    @costumes = @costumes.order('updated_at DESC').page(params[:page]).per(15)
  end

  def fetch
  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to admin_costumes_path, notice: "コスチュームを削除しました。"
  end

  def edit
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = Costume.initialize_by_object_id(params[:object_id])
  end
end
