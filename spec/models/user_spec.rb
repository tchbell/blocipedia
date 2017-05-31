require 'rails_helper'

RSpec.describe User, type: :model do
   # let(:user) { create(:user) }
     let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
    
   
end
