import 'dart:io';

import 'PhysicalBook.dart';
import 'book.dart';

class BookStore {
  List<Book> books = []; // all books in our store
  static double amount = 0; // amount or cost that user have to buy for us
  static List purchasedBooks =
      []; // its a bill or all books the user choose to buy it

  //defult value or books thats will be in our store
  PhysicalBook Start_with_why =
      PhysicalBook("1", 'Start with why', 13, 80, 'Simon Sinek');
  PhysicalBook But_how_do_it_know =
      PhysicalBook('2', 'But how do it know', 22, 59.9, 'J. Clark Scott');
  PhysicalBook Clean_Code =
      PhysicalBook('3', 'Clean Code', 5, 50, 'Robert Cecil Martin');
  PhysicalBook Zero_to_One =
      PhysicalBook('4', 'Zero to One', 12, 45, 'Peter Thiel');
  PhysicalBook You_dont_know_JS =
      PhysicalBook('5', 'You don\'t know JS', 9, 39.9, 'Kyle Simpson');

  //its the constructor where we will initialize defult values
  BookStore() {
    books.add(Start_with_why);
    books.add(But_how_do_it_know);
    books.add(Clean_Code);
    books.add(Zero_to_One);
    books.add(You_dont_know_JS);
  }

  // if we want to add book in our store we will use this methods
  addBook(Book addBook) {
    books.add(addBook);
    print('${addBook.title} added successfully');
  }

  // if we want to remove book from our store
  removeBookByTitle(String title) {
    if (searchByTitle(title).runtimeType.toString() == 'PhysicalBook' ||
        searchByTitle(title).runtimeType.toString() == 'EBook') {
      books.remove(searchByTitle(title));
      print('book with title: \'${title}\' deleted successfully');
    }
  }

  removeBookById(String id) {
    if (searchById(id).runtimeType.toString() ==
            'PhysicalBook' || //check either its PhysicalBook or EBook if not this mean we dont find the book
        searchById(id).runtimeType.toString() == 'EBook') {
      books.remove(searchById(id));
      print('book with id: \'${id}\' deleted successfully');
    }
  }

  searchByTitle(String title) {
    for (Book book in books) {
      if (book.title == title) {
        return book;
      }
    }
    print('Sorry we don\'t have any book with title: ${title} currently');
  }

  searchById(String id) {
    for (Book book in books) {
      if (book.id == id) {
        return book;
      }
    }
    print('Sorry we don\'t have book with this ID: ${id} currently');
    return -1;
  }

  searchByAuthor(String author) {
    // in this methods we return list of all author's book
    List<Book> authorBooks = [];
    for (Book book in books) {
      if (book.author == author) {
        authorBooks.add(book);
      }
    }
    return authorBooks;
  }

  listAllBook() {
    // print all books with it's all info
    for (Book book in books) {
      book.bookInfo();
    }
  }

  buyPhysicalBookByTitle(String title) {
    // in this methods we use it when the user ask ti buy book after that we ask him if he wants to order other book

    bool buyMore =
        true; //this turn to false if the user dont want to order more

    List purchasedBooks = []; //List of all books ordered by the user
    while (buyMore) {
      if (searchByTitle(title).sell().runtimeType.toString() == 'double') {
        purchasedBooks.add(searchByTitle(title));
        amount += searchByTitle(title).price;
      }
      print('Do you want to buy another book? type yes or no');
      String User = (stdin.readLineSync().toString());
      if (User[0] == 'y' || User[0] == 'Y') {
        // if the first letter is y then the user want to order more
        buyMore = true;
        print('please enter title of the book you wants to buy');
        User = (stdin.readLineSync().toString());
        title = User;
      } else {
        buyMore = false;
      }
    }
    //here we print all info and print a bill to the user
    print('you buy these books');
    print('=-=-=-=-=-=-=-');
    for (Book book in purchasedBooks) {
      print('${book.title}    ${book.price}');
    }
    print('--------------');
    print('your total amount: ${amount}');
  }

  buyPhysicalBookByID(String id) {
    //same methods above but if the user choose to buy by id
    bool buyMore = true;

    while (buyMore) {
      if (searchById(id) != -1) {
        searchById(id).sell();
        purchasedBooks.add(searchById(id));
        amount += searchById(id).price;
      }
      print('Do you want to buy another book? type yes or no');
      String User = (stdin.readLineSync().toString());
      if (User == 'yes' || User == 'Yes') {
        buyMore = true;
        print('please enter id of the book you wants to buy');
        User = (stdin.readLineSync().toString());
        id = User;
      } else {
        buyMore = false;
      }
    }
    print('you buy these books');
    print('=-=-=-=-=-=-=-=-=-');
    for (Book book in purchasedBooks) {
      print('${book.title}    ${book.price}');
    }
    print('-------------------');
    print('your total amount: ${amount}');
  }
}
