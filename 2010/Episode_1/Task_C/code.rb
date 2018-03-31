@rect_height = 0
@rect_width = 0
@days_count = 0
@file_data = []

def set_file_number
  File.open('life.in', 'r') do |f|
    f.each_line do |line|
      @file_data << line.split.join('')
    end
  end
end

def set_experiment_details
  @rect_height = @file_data[0][0].to_i
  @rect_width = @file_data[0][1].to_i
  @days_count = @file_data[0][2].to_i
end

def write_to_file
  File.open('life.out', 'w') { |file| file.write calculate_words_count }
end

set_file_number
set_experiment_details
# write_to_file
