@cities = []
@mistakes_count = 0

def read_cities
  File.open('cities.in', 'r') do |f|
    f.each_line do |line|
      @cities << line.split
    end
  end
end

def count_mistakes
  @cities.flatten!
  @cities.each_with_index do |item, i|
    if i < @cities.length - 1
      @mistakes_count += 1 if item[-1, 1] != @cities[i + 1][0].downcase
    end
  end
end

def write_to_file
  File.open('cities.out', 'w') { |file| file.write @mistakes_count }
end

read_cities
count_mistakes
write_to_file