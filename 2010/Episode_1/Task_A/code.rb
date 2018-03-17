@number_from_file = 0

def set_file_number
  File.open('words.in', 'r') do |f|
    f.each_line do |line|
      @number_from_file = line.to_i
    end
  end
end

def calculate_words_count
  @number_from_file * (@number_from_file - 1)
end

def write_to_file
  File.open('words.out','w') {|file| file.write calculate_words_count }
end

set_file_number
calculate_words_count
write_to_file