require_relative 'time_string'

describe 'time_string_calculator' do

  # Valid inputs
  let(:time_single) { "12:34" }
  let(:time_multiple) { "12:32 34:01 15:23 9:27 55:22 25:56" }
  let(:time_out_of_range) { "67:89" }
  let(:time_no_minutes) { "56 78" }

  # Invalid inputs
  let(:number) { 12 }
  let(:words) { "one two three" }
  let(:time_and_words) { "45:45 foo bar" }
  let(:time_missing_seconds) { "12:4" }

  it 'returns a string' do
    expect(time_string_calculator(time_single)).to be_an_instance_of String
  end

  it 'returns a sum of input times for single input time' do
    expect(time_string_calculator(time_single)).to eq '12:34'
  end
  it 'returns a sum of input times for multiple inputs times' do
    expect(time_string_calculator(time_multiple)).to eq '2:32:41'
  end
  it 'returns a sum of input times for input times out out of normal 60 min/sec range' do
    expect(time_string_calculator(time_out_of_range)).to eq '1:08:29'
  end
  it 'returns a sum of input times for input times without minutes' do
    expect(time_string_calculator(time_no_minutes)).to eq '2:14'
  end

  it 'raises an error for input as an integer' do
    expect{time_string_calculator(number)}.to raise_error(ArgumentError, 'Input must be a string.')
  end
  it 'raises an error for input as non-time words' do
    expect{time_string_calculator(words)}.to raise_error(ArgumentError, 'Input must be formatted as SS, M:SS, MM:SS, or H:MM:SS')
  end
  it 'raises an error for input containing non-time words' do
    expect{time_string_calculator(time_and_words)}.to raise_error(ArgumentError, 'Input must be formatted as SS, M:SS, MM:SS, or H:MM:SS')
  end
  it 'raises an error for missing digit in the seconds position' do
    expect{time_string_calculator(time_missing_seconds)}.to raise_error(ArgumentError, 'Input must be formatted as SS, M:SS, MM:SS, or H:MM:SS')
  end

end