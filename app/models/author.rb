class Author < ApplicationRecord
  has_many :books, dependent: :destroy # Dependencia fuerte
end
