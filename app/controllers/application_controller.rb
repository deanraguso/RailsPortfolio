class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent
    before_action :set_copyright
end

def set_copyright
    @copyright = DeanViewTool::Renderer.copyright "Dean Ragz", "All rights reserved"
end

module DeanViewTool
    class Renderer
        def self.copyright name, msg
            "&copy #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end