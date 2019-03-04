class Header < ApplicationRecord
  belongs_to :document

  # scopes
  scope :find_intensities, ->(term, document_id) { \
    where(Header.arel_table[:name].matches("%#{term}%") \
    .and(Header.arel_table[:document_id].eq(document_id))) }

  scope :find_proteins, ->(term, document_id) { \
    where(Header.arel_table[:name].matches("#{term}%") \
    .and(Header.arel_table[:document_id].eq(document_id)))&.first }
end
