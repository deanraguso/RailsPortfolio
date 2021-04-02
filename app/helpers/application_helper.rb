module ApplicationHelper
    def login_helper style
        if current_user.is_a?(User)
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        else 
            (link_to "Register", new_user_registration_path, method: :get, class: style) + 
            (link_to "Login", new_user_session_path, method: :get, class: style) 
        end
    end

    def source_helper(app)
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}, currently on #{app} layout!"
            content_tag(:p, greeting)
        end
        
    end

    def copyright_generator
        DeanViewTool::Renderer.copyright "Dean Ragz", "All rights reserved"
    end
end