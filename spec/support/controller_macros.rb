

module ControllerMacros
    def login_user
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            user = FactoryBot.create(:user)
            sign_in user
        end
    end

    def signout_user
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            user = FactoryBot.create(:user)
            sign_out user
        end
    end
end