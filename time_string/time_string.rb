
def time_string_calculator(str)
  raise ArgumentError, 'Input must be a string.' unless str.class == String
  times_arr = str.split(' ')
  seconds_arr = times_arr.map do |t|
    if valid_time?(t)
      time_to_seconds(t)
    else
      raise ArgumentError, 'Input must be formatted as S, SS, M:SS, MM:SS, or H:MM:SS'
    end
  end
  seconds = seconds_arr.inject(:+)
  seconds_to_time(seconds)
end

def valid_time?(time)
  if time =~ /^\d*:*\d*:*\d{2}$/ || time =~ /^\d{1}$/
    true
  else
    false
  end
end

def time_to_seconds(time)
  total_seconds = 0
  time.split(':').reverse.each_with_index do |d,i|
    seconds = d.to_i * (60**i)
    total_seconds += seconds
  end
  total_seconds
end

def seconds_to_time(sec)
  time = ""
  hours = sec/3600
  minutes = (sec/60 - hours*60)
  seconds = (sec - (minutes*60 + hours*3600))
  time << hours.to_s+":"
  time << minutes.to_s.rjust(2,'0')+":"
  time << seconds.to_s.rjust(2,'0')
  time[/(1|2|3|4|5|6|7|8|9).*/]
end