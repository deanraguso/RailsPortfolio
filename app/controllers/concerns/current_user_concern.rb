module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
        before_action :current_user
    end

    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(name:"Guest", first_name:"Guest", last_name:"User", email:"sample_email@sample.com")
    end
end