class Book

  # Class Variables
  @@on_shelf = []
  @@on_loan  = []

  attr_accessor :due_date, :title , :author, :available

  # CLASS METHODS

  # NEW BOOK
  def self.create(title, author, isbn)

    new_book = Book.new(title, author, isbn)
    puts new_book

    @@on_shelf << new_book


    new_book

  end

  # Which Books are available
  def self.available

    @@on_shelf.each {|book| puts book.info}

  end

  # Borrowed Books
  def self.borrowed
      @@on_loan
  end

  #Browse Random Books
  def self.browse
    @@on_shelf.sample
  end

  # Today's Date plus 14 days
  def self.current_due_date
    current_due_date = Time.now + (14 * 86400)

  end

  def self.overdue
    overdue_books = []
    @@on_loan.each do |book|

      if book.due_date < Time.now
        overdue_books << book
      end
    end
      return overdue_books
  end



  # INSTANCE METHODS
  def initialize(title, author, isbn)

    @title  =  title
    @author =  author
    @isbn   =  isbn


  end

  def info
     puts "Author #{@author}"
     puts "Title: #{@title}"

  end

  def lent_out?
     @@on_loan.each do |book|
      if book == self
        return true
      end
    end
    false
  end
    # Borrow a Book, move from on shelf > on loan array
     def borrow
       if self.lent_out?
         return false
       else
         @due_date = Book.current_due_date

         @@on_shelf.delete(self)
         @@on_loan << self
       end
       true
     end

     def return_to_library
       if self.lent_out? == false
         return false
       else
         @@on_loan.delete(self)
         @@on_shelf << self
         @due_date = nil
       end
       true
     end
end


# TESTING

that_book = Book.create("crying", "Over You", 17883)
this_book = Book.create("fun","A.A.Me", 1788345)
# this_book.info

# Book.available
# puts Book.browse.inspect
# this_book.inspect
# p this_book.lent_out?
# puts "*********"
# Book.available.inspect
# puts "Borrow The BOOK"
# this_book.borrow
# Book.available.inspect
# puts "return to Library"
# puts"************"
# this_book.return_to_library
# Book.available.inspect

p this_book.borrow.inspect
puts "**"
p this_book.inspect
puts "**"
this_book.due_date=(Time.now - 90000)
puts "**"
p Book.overdue.inspect
