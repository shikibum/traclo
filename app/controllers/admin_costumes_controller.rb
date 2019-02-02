# frozen_string_literal: true

class AdminCostumesController < ApplicationController
  def index
    @costumes = Costume.all
    @costumes = @costumes.where(continent: params[:continent]) if params[:continent].present?
    if params[:culture_or_country].present?
      @costumes = @costumes
                  .where(country_japanese: params[:culture_or_country])
                  .or(Costume.where(culture_japanese: params[:culture_or_country]))
    end
    @costumes = Costume.where(title_japanese: nil) if params[:no_title_japanese].present?
    @costumes = @costumes.order('updated_at DESC').page(params[:page]).per(15)
  end

  def fetch; end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to admin_costumes_path, notice: 'コスチュームを削除しました。'
  end

  def edit
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = if params[:object_id].include?('https')
                 Costume.initialize_by_title_url(params[:object_id])
               else
                 Costume.initialize_by_object_id(params[:object_id])
               end
  end
end
