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

def remove_array_element
  @file_data.shift
end

def virus?(symbol)
  symbol == 'O'
end

def count_neighbor_viruses(string_position,symbol_position)
  counter = 0
  if string_position > 0
    if symbol_position > 0
      counter += 1 if @file_data[string_position-1][symbol_position - 1] == 'O'
      counter += 1 if @file_data[string_position-1][symbol_position] == 'O'
      counter += 1 if @file_data[string_position-1][symbol_position + 1] == 'O'
      counter += 1 if @file_data[string_position][symbol_position - 1] == 'O'
      counter += 1 if @file_data[string_position][symbol_position + 1] == 'O'
      counter += 1 if @file_data[string_position+1][symbol_position - 1] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position + 1] == 'O' unless @file_data[string_position+1].nil?
    else
      counter += 1 if @file_data[string_position-1][symbol_position] == 'O'
      counter += 1 if @file_data[string_position-1][symbol_position + 1] == 'O'
      counter += 1 if @file_data[string_position][symbol_position + 1] == 'O'
      counter += 1 if @file_data[string_position+1][symbol_position] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position + 1] == 'O' unless @file_data[string_position+1].nil?
    end
  else
    if symbol_position > 0
      counter += 1 if @file_data[string_position+1][symbol_position - 1] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position + 1] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position][symbol_position - 1] == 'O'
      counter += 1 if @file_data[string_position][symbol_position + 1] == 'O'
    else
      counter += 1 if @file_data[string_position+1][symbol_position] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position+1][symbol_position + 1] == 'O' unless @file_data[string_position+1].nil?
      counter += 1 if @file_data[string_position][symbol_position + 1] == 'O'
    end
  end
  counter
end

def count_viruses
  @days_count.times do |day|
    @file_data.each_with_index do |item,string_index|
      item.each_char.with_index do |character,symbol_index|
        neighbor_viruses_count = count_neighbor_viruses(string_index,symbol_index)
        if virus?(character)
          @file_data[string_index][symbol_index] = 'X' if neighbor_viruses_count < 2 || neighbor_viruses_count > 3
        else
          @file_data[string_index][symbol_index] = 'O' if neighbor_viruses_count == 3
        end
      end
    end
  end
end

def write_to_file
  File.open('life.out', 'w') { |file| file.write calculate_words_count }
end

set_file_number
set_experiment_details
remove_array_element
count_viruses
p @file_data

# write_to_file
