class Folio < ApplicationRecord
    validates_presence_of :title, :subtitle, :body
end
