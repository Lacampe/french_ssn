require_relative '../french_ssn.rb'

describe '#french_ssn_info' do
  it 'should return "The SSN is invalid" when passed an empty string' do
    expect(french_ssn_info('')).to eq('The SSN is invalid')
  end
end
