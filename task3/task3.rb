class LibraryItem
  attr_accessor :title, :author, :year

  def initialize(title, author, year)
    @title = title
    @author = author
    @year = year
  end

  # Method to display common info
  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "Publication Year: #{@year}"
  end
end

class Book < LibraryItem
  attr_accessor :genre

  def initialize(title, author, year, genre)
    super(title, author, year)
    @genre = genre
  end

  # Override display_info to include genre
  def display_info
    super
    puts "Genre: #{@genre}"
    puts "-" * 30
  end
end

class DVD < LibraryItem
  attr_accessor :director, :genre

  def initialize(title, director, year, genre)
    super(title, director, year)
    @director = director
    @genre = genre
  end

  # Override display_info to include director and genre
  def display_info
    super
    puts "Director: #{@director}"
    puts "Genre: #{@genre}"
    puts "-" * 30
  end
end

class CD < LibraryItem
  attr_accessor :artist, :genre

  def initialize(title, artist, year, genre)
    super(title, artist, year)
    @artist = artist
    @genre = genre
  end

  # Override display_info to include artist and genre
  def display_info
    super
    puts "Artist: #{@artist}"
    puts "Genre: #{@genre}"
    puts "-" * 30
  end
end

# Library class to manage items
class Library
  def initialize
    @items = []
  end

  # Method to add an item
  def add_item(item)
    @items << item
    puts "#{item.title} has been ADDED to the library."
    puts "\n"
  end

  # Method to remove an item
  def remove_item(item)
    puts "\n"
    if @items.delete(item)
      puts "#{item.title} has been REMOVED from the library."
    else
      puts "#{item.title} not found in the library."
    end
  end

  # Method to display info about all items
  def display_all_items
    puts "\n\n"
    puts "\nLibrary Catalog:"
    puts "=" * 30
    @items.each { |item| item.display_info }
    puts "\n\n"
  end

  # Polymorphic method to display info of a single item
  def display_item_info(item)
    if @items.include?(item)
      puts "\nDisplaying info for: #{item.title}"
      puts "-" * 30
      item.display_info
    else
      puts "#{item.title} is not in the library."
    end
  end
end

# ### Test cases ###

# Instance creation
book = Book.new("Concepts of Programming Languages", "Robert Sebesta", 2024, "Programming")
dvd = DVD.new("Inception", "Christopher Nolan", 2010, "Science Fiction")
cd = CD.new("A Day at the Races", "Queen", 1976, "Rock")

# ## Display items seperately (unnecessary, but good for testing)
# puts "Individual Item info:"
# puts "=" * 30
# book.display_info
# dvd.display_info
# cd.display_info

# Adding diff.items to create library 
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)

# Display everything in the library
library.display_all_items

# Demo polymorphism of dvd
library.display_item_info(dvd)

# Removing book
library.remove_item(book)

# Checking after removal
library.display_all_items


### Reference for Ruby:

## polymorphism-in-ruby
# https://www.geeksforgeeks.org/polymorphism-in-ruby/
 
## decision-making-ternary-in-ruby
# https://www.geeksforgeeks.org/ruby-decision-making-if-if-else-if-else-if-ternary-set-1/
