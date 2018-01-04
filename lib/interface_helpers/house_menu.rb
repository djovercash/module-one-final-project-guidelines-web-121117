module HouseMenu

  def houses_menu_options
    puts "\nHOUSE MENU".colorize(:green).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Houses".colorize(:green) + " - see all houses of the GoT Universe."
    puts "     Characters".colorize(:green) + " - see which characters belong to a specific house."
    puts "     Gender".colorize(:green) + " - see how many members of a specific gender belong to a specific house."
    puts "     Lord".colorize(:green) + " - see which character is currently the Lord of a specific house."
    puts "     Region".colorize(:green) + " - see what region a house is located."
    puts "     Main Menu".colorize(:green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def houses_menu
    input = houses_menu_options
    if input == "houses"
      puts "\n"
      puts all_houses
      puts "\n"
      houses_menu
    elsif input == "characters"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters = house.characters
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      houses_menu
    elsif input == "gender"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters_from_house = house.characters
      puts "\nWould you like to see the males or females of #{house.name}. Please put 'Male' or 'Female':"
      gender_input = gets.chomp
      puts "\nHere are the characters of #{house.name} who identify as #{gender_input}:"
      find_characters_by_gender(characters_from_house, gender_input)
      puts "\n"
      houses_menu
    elsif input == "lord"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      if house.current_lord_id == nil
        puts "\nThere is no current lord for #{house.name}."
      else
        character = Character.find(house.current_lord_id)
        puts "\nThe current lord of #{house.name} is #{character.name}."
        puts "\n"
      end
      houses_menu
    elsif input == "region"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      puts "\nThe region where you can find #{house.name} is #{house.region.name}."
      puts "\n"
      houses_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nPlease don't wonder beyond the wall.".colorize(:green)
      houses_menu
    end
  end

end
