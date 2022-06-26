import 'dart:io';

main() {
  BookStore ourStore =
      BookStore(); // our Book Store where all books and other information will be saved here
  String User = '0';
  do {
    print(" ----------------------------------");
    print('|                                  |');
    print("|      Wellcome To Our library     |");
    print('|                                  |');
    print(" ----------------------------------");
    print('');
    print('Please choose the service you want');
    print('');
    print(" ----------------------------------");
    print("|  1- Add PhysicalBook             |");
    print("|  2- Add eBook                    |");
    print("|  3- Remove book from BookStore   |");
    print("|  4- Show all books in BookStore  |");
    print("|  5- search a book in BookStore   |");
    print("|  6- Buy PhysicalBook             |");
    print("|  0- Exit                         |");
    print(" ----------------------------------");

    User = (stdin.readLineSync().toString());
    switch (User) {
      case '1': //Add PhysicalBook
        {
          print('please enter title of the book');
          String title = (stdin.readLineSync().toString());
          print('please enter Quantity');
          String Quantity = (stdin.readLineSync().toString());
          int Quantity_int = int.parse(Quantity);
          print('please enter price');
          String price = (stdin.readLineSync().toString());
          double price_double = double.parse(price);
          print('please enter author name');
          String author = (stdin.readLineSync().toString());

          PhysicalBook addedBook = PhysicalBook(
              (ourStore.books.length + 1).toString(),
              title,
              Quantity_int,
              price_double,
              author);
          ourStore.addBook(addedBook);
          break;
        }
      case '2': //Add eBook
        {
          print('please enter title of the book');
          String title = (stdin.readLineSync().toString());
          print('please enter price');
          String price = (stdin.readLineSync().toString());
          double price_double = double.parse(price);
          print('please enter author name');
          String author = (stdin.readLineSync().toString());
          EBook addedEbook = EBook(
              id: (ourStore.books.length + 1).toString(),
              title: title,
              price: price_double,
              author: author);
          ourStore.addBook(addedEbook);
          break;
        }
      case '3': //Remove book from BookStore
        {
          print('Do you want to delete by name or by id? ');
          User = (stdin.readLineSync().toString());
          if (User == 'name' || User == 'Name') {
            print('Please Enter name of the book you want to remove');
            User = (stdin.readLineSync().toString());
            ourStore.removeBookByTitle(User);
          } else if (User == 'id' || User == 'Id' || User == 'ID') {
            print('Please Enter ID of the book you want to remove');
            User = (stdin.readLineSync().toString());
            ourStore.removeBookById(User);
          } else {
            print('please enter either id or name');
          }
          break;
        }
      case '4': //Show all books in BookStore
        {
          ourStore.listAllBook();
          break;
        }
      case '5': //search a book in BookStore
        {
          print(
              'Do you want to search by: (Please enter your choice ex:titlt,id etc)');
          print('1-Title');
          print('2-ID');
          print('3-Author');
          User = (stdin.readLineSync().toString());
          if (User == 'Title' || User == 'title') {
            print('Please enter the title you want search about');
            User = (stdin.readLineSync().toString());
            ourStore.searchByTitle(User).bookInfo();
          } else if (User == 'id' || User == 'ID' || User == 'Id') {
            print('Please enter the ID you want search about');
            User = (stdin.readLineSync().toString());
            ourStore.searchById(User).bookInfo();
          } else if (User == 'Author' || User == 'author') {
            print('Please enter the author name you want search about');
            User = (stdin.readLineSync().toString());
            if (ourStore.searchByAuthor(User).length != 0) {
              for (Book book in ourStore.searchByAuthor(User)) {
                book.bookInfo();
              }
            } else {
              print('Author: ${User} dont have any book in our bookstore');
            }
          }
          break;
        }
      case '6': //Buy PhysicalBook
        {
          print('You wants to buy by ID or title');
          User = (stdin.readLineSync().toString());
          if (User == 'ID' || User == 'id' || User == 'Id') {
            print('Please enter the id of the book you want to buy');
            User = (stdin.readLineSync().toString());
            ourStore.buyPhysicalBookByID(User);
          } else if (User == 'title' || User == 'Title') {
            print('Please enter the name of the book you want to buy');
            User = (stdin.readLineSync().toString());
            ourStore.buyPhysicalBookByTitle(User);
          } else {
            print('please enter either id or title');
          }

          break;
        }
    }
  } while (User != '0'); // if the user enter 0 we will close the app
}

abstract class Book {
  String? title;
  String? id;
  double? price;
  String? author;

  sell(); // if the user want to buy we will use this methods
  bookInfo();
}

class PhysicalBook implements Book {
  @override
  String? id;

  @override
  String? title;

  @override
  double? price;

  @override
  String? author;
  int quantity = 0;

  PhysicalBook(this.id, this.title, this.quantity, this.price, this.author);

  double getPrice() {
    return price!;
  }

  void setPrice(double price) {
    this.price = price;
  }

  @override
  sell() {
    if (quantity > 0) {
      // if we have the book in our inventory
      quantity = quantity - 1;
      return price;
    } else {
      print('Sorry, the book is not available at the moment');
    }
  }

  @override
  bookInfo() {
    print(
        'ID: ${this.id}  Title: ${this.title}   Price: ${this.price}    Author: ${this.author}    Quantity: ${this.quantity}    Type:${this.runtimeType.toString()}');
  }
}

class EBook implements Book {
  // electronic book
  @override
  String? id;

  @override
  String? title;

  @override
  double? price;

  @override
  String? author;
  EBook({this.id, this.title, this.price, this.author});

  @override
  sell() {
    // we dont have limit or quantity for ebook so we will download the book for the user if he buy it
    print('download eBook');
  }

  bookInfo() {
    print(
        'ID: ${this.id}  Title: ${this.title}   Price: ${this.price}    Author: ${this.author}    Type:${this.runtimeType.toString()}');
  }
}

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
      if (searchById(id).sell().runtimeType.toString() == 'double') {
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
