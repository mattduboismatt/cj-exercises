require_relative 'time_string'

describe "time_string_calculator" do

  let(:time_single) { "12:34" }
  let(:time_multiple) { "12:32 34:01 15:23 9:27 55:22 25:56" }
  let(:time_single_no_minutes) { "56" }
  let(:time_single_out_of_range) { "67:89" }
  let(:words) { "one two three" }

  it 'returns a string' do
    expect(time_string_calculator(time_single)).to be_an_instance_of String
  end

end