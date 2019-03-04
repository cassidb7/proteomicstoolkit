class Content < ApplicationRecord
  belongs_to :document

  def self.get_max_limit(protein:, intensity:)
    column_name = "intensity_" + intensity.to_s
    column_name_prefixed = "contents." + column_name

    Content.where(Content.arel_table[:protein].eq("#{protein}")
      .and(Content.arel_table[column_name.to_sym].not_eq(nil)))
      .select(column_name_prefixed).order(column_name_prefixed + " DESC")
      .limit(3).sum(column_name.to_sym)
  end
end
