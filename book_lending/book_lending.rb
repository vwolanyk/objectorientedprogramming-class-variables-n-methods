class Book

  # Class Variables
  @@on_shelf = []
  @@on_loan  = []

  attr_accessor :due_date, :title , :author

  # CLASS METHODS

  # NEW BOOK
  def self.create(title, author, isbn)

    new_book = Book.new(title, author, isbn)

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






end


# TESTING

that_book = Book.create("crying", "Over You", 17883)
this_book = Book.create("fun","A.A.Me", 1788345)
# this_book.info

Book.available
puts Book.browse
