class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: { in: %w(uno dos tres cuatro cinco)}
  validates :value, numericality: { greater_than: 0}
  validates :discount, numericality: { less_than: 40}
end
