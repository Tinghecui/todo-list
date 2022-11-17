require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'find' do
    it 'should add new task' do
      User.create(:email => "test@gmail.com", :password =>"123456")
      expect(User.find_by(:email => 'test@gmail.com')).to_not be_nil
    end
  end
end
