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
    current_due_date.ctime
  end



  # INSTANCE METHODS
  def initialize(title, author, isbn)

    @title  =  title
    @author =  author
    @isbn   =  isbn
    @available = true

  end

  def info
     puts "Author #{@author}"
     puts "Title: #{@title}"

  end

  def lent_out?
     if @available == false
        true
     else false
     end
  end






end


# TESTING

that_book = Book.create("crying", "Over You", 17883)
this_book = Book.create("fun","A.A.Me", 1788345)
# this_book.info

Book.available
puts Book.browse.inspect
this_book.inspect
p this_book.lent_out?
p Book.current_due_date
