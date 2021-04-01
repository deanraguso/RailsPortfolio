class Folio < ApplicationRecord
    validates_presence_of :title, :subtitle, :body
    include Placeholder

    def self.angular
        where(subtitle:"Angular")
    end
    scope :rails, -> { where(subtitle:"Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator('600', '400')
        self.thumb_image ||= Placeholder.image_generator('350', '200')
    end
end
