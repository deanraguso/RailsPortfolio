class Folio < ApplicationRecord
    validates_presence_of :title, :subtitle, :body

    def self.angular
        where(subtitle:"Angular")
    end
    scope :rails, -> { where(subtitle:"Rails") }
end
