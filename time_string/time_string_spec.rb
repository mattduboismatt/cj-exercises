require_relative 'time_string'

describe '#time_string_calculator' do

  # Valid inputs
  let(:time_single) { "12:34" }
  let(:time_multiple) { "12:32 34:01 15:23 9:27 55:22 25:56" }
  let(:time_out_of_range) { "67:89" }
  let(:time_no_minutes) { "56 78" }
  let(:time_single_digit) { "4" }
  let(:time_with_hours) { "2:00:00 3:00:00" }

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
  it 'returns a sum of input times for input times as single digit' do
    expect(time_string_calculator(time_single_digit)).to eq '4'
  end
  it 'returns a sum of input times for input times as with hours' do
    expect(time_string_calculator(time_with_hours)).to eq '5:00:00'
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

describe '#valid_time?' do
  it 'returns true for valid time inputs' do
    valid_times = ["34","1:23","67:67:67","1"]
    valid_times.each do |t|
      expect(valid_time?(t)).to eq true
    end
  end
  it 'returns false for invalid time inputs' do
    invalid_times = ['foo', '12:4', nil]
    invalid_times.each do |t|
      expect(valid_time?(t)).to eq false
    end
  end
end

describe '#time_to_seconds' do
  it 'converts time string to seconds' do
    expect(time_to_seconds("1:23")).to eq 83
    expect(time_to_seconds("99:00")).to eq 5940
    expect(time_to_seconds("2:34:56")).to eq 9296
    expect(time_to_seconds("100:00:00")).to eq 360000
  end
end

describe '#seconds_to_time' do
  it 'converts seconds to time strings' do
    expect(seconds_to_time(83)).to eq "1:23"
    expect(seconds_to_time(5940)).to eq "1:39:00"
    expect(seconds_to_time(9296)).to eq "2:34:56"
    expect(seconds_to_time(360000)).to eq "100:00:00"
    expect(seconds_to_time(45)).to eq "45"
  end
end