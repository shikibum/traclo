# frozen_string_literal: true

class AdminCostumesController < ApplicationController
  def index
    @costumes = Costume.all
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
