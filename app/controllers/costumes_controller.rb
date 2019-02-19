# frozen_string_literal: true

class CostumesController < ApplicationController
  def index
    @costumes = Costume.where.not(title_japanese: nil)
    @costumes = @costumes.where(continent: params[:continent]) if params[:continent].present?
    if params[:culture_or_country].present?
      @costumes = @costumes
                  .where(country_japanese: params[:culture_or_country])
                  .or(Costume.where(culture_japanese: params[:culture_or_country]))
    end
    @costumes = @costumes.order('random()').page(params[:page]).per(20)
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to admin_costumes_path, notice: 'コスチュームを保存しました'
    else
      render action: 'new'
    end
  end

  def update
    @costume = Costume.find(params[:id])
    if @costume.update(costume_params)
      redirect_to admin_costumes_path, notice: 'コスチュームを更新しました。'
    else
      render action: 'edit'
    end
  end

  def show
    @costume = Costume.find(params[:id])
  end

  private

  def costume_params
    params.require(:costume).permit(
      :object_id,
      :original_image_url,
      :title,
      :title_japanese,
      :culture,
      :culture_japanese,
      :country,
      :country_japanese,
      :region,
      :region_japanese,
      :object_url,
      :continent,
      :date,
      :date_japanese
      )
  end
end
