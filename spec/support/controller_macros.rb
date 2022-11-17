FactoryBot.define do    
    factory :user do
        sequence(:email) { |n| "test-#{n.to_s,rjust(3, "0")}@sample.com" }
        password { "123456" }
    end
end

module ControllerMacros
    def login_user
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            user = FactoryBot.create(:user)
            sign_in user
        end
    end
end