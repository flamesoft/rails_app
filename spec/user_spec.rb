require 'rails_helper.rb'

RSpec.describe User , type: :model do
  subject { described_class.new(name: 'Yan', email:'y@gmail.com')}
  describe 'Validations of name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(10) }
  end
  it 'is expected to have a mailboxer_name' do
    expect(:mailboxer_name).not_to be nil
  end
  it 'is expected to have a mailboxer_email' do
    expect(:mailboxer_email).not_to be nil
  end
end
