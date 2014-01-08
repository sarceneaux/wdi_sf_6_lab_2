pages_with_questions = {}  # creates a new hash

lines_grabbed = ""  # initializes 
key = ""

File.open("story.txt", "r") do |infile|
  while (line = infile.gets) # while we are grabbing
    if line.index("~p") # it captures, and looks for ~p identifier is there
    	key = line.chomp # grab identifier and store as a key
    	lines_grabbed = "" # grabs all lines after identifier
    else
      lines_grabbed += line
    end
    pages_with_questions[key] = lines_grabbed
  end
end

p1 = pages_with_questions.select do |key,value|
	key.index("~p1")
end

p1.each do |k,v|
	puts v
end

puts "Enter c1, c2 or c3"

user_choice = gets.chomp

choices = pages_with_questions.select do |key, value| 
key.index user_choice
end

story_key = ""
choices.each {|k,v| story_key = "~"+k[-2]+k[-1]}

print pages_with_questions[story_key]