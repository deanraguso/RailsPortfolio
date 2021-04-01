module Placeholder
    extend ActiveSupport::Concern

    def self.image_generator(height, width)
        return "http://placehold.it/#{height}x#{width}"
    end
end 