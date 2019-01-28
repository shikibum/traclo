# frozen_string_literal: true

class CostumesController < ApplicationController
  def index
    @costumes = Costume.all.page(params[:page]).per(20)
    if params[:continent].present?
      @costumes = @costumes.where(continent: params[:continent])
    end
    if params[:culture_or_country].present?
      @costumes = @costumes
                    .where(country_japanese: params[:culture_or_country])
                    .or(Costume.where(culture_japanese: params[:culture_or_country]))
    end
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to admin_costumes_path, notice: "コスチュームを保存しました"
    else
      render action: "new"
    end
  end

  def update
    @costume = Costume.find(params[:id])
    if @costume.update(costume_params)
      redirect_to admin_costumes_path, notice: "コスチュームを更新しました。"
    else
      render action: "edit"
    end
  end

  private
    def costume_params
      params.require(:costume).permit(
        :object_id,
        :primary_image,
        :title,
        :title_japanese,
        :culture,
        :culture_japanese,
        :country,
        :country_japanese,
        :region,
        :region_japanese,
        :object_url,
        :continent
      )
    end
end
