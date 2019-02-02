# frozen_string_literal: true

module CostumesHelper
  def extract_culture_and_country_from_costumes(continent)
    Costume.where(continent: continent)
           .select(:country_japanese, :culture_japanese)
           .group(:country_japanese, :culture_japanese)
           .map do |costume|
      if costume.country_japanese.present?
        costume.country_japanese
      else
        costume.culture_japanese
      end
    end.uniq.compact
  end
end
