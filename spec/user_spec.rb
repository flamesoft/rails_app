require 'rails_helper.rb'

RSpec.describe User , type: :model do
  describe 'Validations of name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(10) }
  end
end
