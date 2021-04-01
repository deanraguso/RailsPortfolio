class Folio < ApplicationRecord
    validates_presence_of :title, :subtitle, :body

    def self.angular
        where(subtitle:"Angular")
    end
    scope :rails, -> { where(subtitle:"Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end
end
