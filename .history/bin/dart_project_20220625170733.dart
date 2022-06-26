import 'dart:io';

main() {
  BookStore ourStore = BookStore();
  String User = '9';
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
    print("|  0- Exit                         |");
    print(" ----------------------------------");

    User = (stdin.readLineSync().toString());
    switch (User) {
      case '1':
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
      case '2':
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
      case '3':
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
      case '4':
        {
          ourStore.listAllBook();
          break;
        }
    }
  } while (User != '0');

  // print(
  //     "Note: You can search for the book using the ways below by Writing The Word inside the brackets");
  // print("1- The (Name) For the Book");
  // print("2- (ID) for the Book");
  // print("3- The (Author) Name ");
  // String User = (stdin.readLineSync().toString());

// //Class Name
//   if (User == "Name") {
//     print("------------------------------------");
//     print("ID:     Book Name:               Author Name:    ");
//     print("1       Sinek Start wi           Simon Sinek     ");
//     print("2       But how do it Know       J. Clark Scott");
//     print("3       Clean Code               Rpbert Cecil Martin ");
//     print("4       Zero to One              Peter Thiel");
//     print("------------------------------------");
//     print("Please Write The Name For The Book:");

//     String Name = (stdin.readLineSync().toString());
//     print("You wrote :$Name");
//     print("is That Correct ?");
//     //Using Siwtch with IF Statment
//     String answer = (stdin.readLineSync().toString());
//     if (answer == "yes" && Name == "Sinek Start wi") {
//       print(
//           "You choose : ID:1     Book Name:Sinek Start wi                Author Name:Simon Sinek                 Price:80SAR           Quantity:13 ");
//     } else if (answer == "yes" && Name == "But how do it Know") {
//       print(
//           "You choose : ID:2    Book: Name:But how do it Know            Author Name:J. Clark Scott              Price:59.9SAR         Quantity:22 ");
//     } else if (answer == "yes" && Name == "Clean Code") {
//       print(
//           "You choose : ID:3    Book Name:Clean Code                     Author Name: Rpbert Cecil Martin        Price:50SAR           Quantity:5");
//     } else if (answer == "yes" && Name == "Zero to One") {
//       print(
//           "You choose : ID:4    Book Name:  Zero to One                  Author Name: Peter Thiel                Price:45SAR           Quantity:12");
//     }
//   } else {
//     print("The Problem in Class Name Please Try Again");
//   } //put "brake" when you using Switch

// //-----------------------------------------------------------------------------------------------------------

// //Class ID
//   if (User == "ID") {
//     print("------------------------------------");
//     print("ID:     Book Name:               Author Name:    ");
//     print("1       Sinek Start wi           Simon Sinek     ");
//     print("2       But how do it Know       J. Clark Scott");
//     print("3       Clean Code               Rpbert Cecil Martin ");
//     print("4       Zero to One              Peter Thiel");
//     print("------------------------------------");
//     print("Please Write The ID Number For The Book:");
//     String ID = (stdin.readLineSync().toString());
//     print("You wrote :$ID");
//     print("is That Correct ?");
//     //Using Siwtch with IF Statment
//     String answer = (stdin.readLineSync().toString());
//     if (answer == "yes" && ID == "1") {
//       print(
//           "You choose : ID:1       Book Name:Sinek Start wi            Author Name:Simon Sinek  ");
//     } else if (answer == "yes" && ID == "2") {
//       print(
//           "You choose : ID:2     Book: Name:But how do it Know            Author Name:J. Clark Scott  ");
//     } else if (answer == "yes" && ID == "3") {
//       print(
//           "You choose : ID:3     Book Name:Clean Code           Author Name: Rpbert Cecil Martin  ");
//     } else if (answer == "yes" && ID == "4") {
//       print(
//           "You choose : ID:4    Book Name:  Zero to One           Author Name: Peter Thiel  ");
//     }
//   } else {
//     print("The Problem in Class ID Please Try Again");
//   } //put "brake" when you using Switch

// //-----------------------------------------------------------------------------------------------------------

// //Class Autour
//   if (User == "Author") {
//     print("------------------------------------");
//     print("ID:     Book Name:               Author Name:    ");
//     print("1       Sinek Start wi           Simon Sinek     ");
//     print("2       But how do it Know       J. Clark Scott");
//     print("3       Clean Code               Rpbert Cecil Martin ");
//     print("4       Zero to One              Peter Thiel");
//     print("------------------------------------");
//     print("Please Write The Author Name For The Book:");
//     String Author = (stdin.readLineSync().toString());
//     print("You wrote :$Author");
//     print("is That Correct ?");
//     //Using Siwtch with IF Statment
//     String answer = (stdin.readLineSync().toString());
//     if (answer == "yes" && Author == "Simon Sinek") {
//       print(
//           "You choose : ID:1       Book Name:Sinek Start wi            Author Name:Simon Sinek  ");
//     } else if (answer == "yes" && Author == "J.Clark Scott") {
//       print(
//           "You choose : ID:2     Book: Name:But how do it Know            Author Name:J. Clark Scott  ");
//     } else if (answer == "yes" && Author == "Rpbert Cecil Martin") {
//       print(
//           "You choose : ID:3     Book Name:Clean Code           Author Name: Rpbert Cecil Martin  ");
//     } else if (answer == "yes" && Author == "Peter Thiel") {
//       print(
//           "You choose : ID:4    Book Name:  Zero to One           Author Name: Peter Thiel  ");
//     }
//   } else {
//     print("The Problem in Class Author Please Try Again");
//   } //put "brake" when you using Switch
}

abstract class Book {
  String? title;
  String? id;
  double? price;
  String? author;

  sell();
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
  @override
  sell() {
    if (quantity > 0) {
      quantity = quantity - 1;
      return price;
    } else {
      print('Sorry, the book is not available at the moment');
    }
  }
}

class EBook implements Book {
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
    print('download eBook');
  }
}

class BookStore {
  List<Book> books = [];

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

  BookStore() {
    books.add(Start_with_why);
    books.add(But_how_do_it_know);
    books.add(Clean_Code);
    books.add(Zero_to_One);
    books.add(You_dont_know_JS);
  }
  addBook(Book addBook) {
    books.add(addBook);
    print('${addBook.title} added successfully');
  }

  removeBookByTitle(String title) {
    if (searchByTitle(title).runtimeType.toString() == 'Book') {
      print(books.remove(searchByTitle(title)).toString());
    }
  }

  removeBookById(String id) {
    if (searchById(id).runtimeType.toString() == 'Book') {
      print(books.remove(searchById(id)).toString());
    }
  }

  searchByTitle(String title) {
    for (Book book in books) {
      if (book.title == title) {
        return book;
      } else {
        print('Sorry we don\'t have any book with title: ${title} currently');
      }
    }
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
    List<Book> authorBooks = [];
    for (Book book in books) {
      if (book.author == author) {
        authorBooks.add(book);
      }
    }
    return authorBooks;
  }

  listAllBook() {
    for (Book book in books) {
      print(
          "ID: ${book.id}     Book Name: ${book.title}               Author Name: ${book.author}               Price:${book.price}               type: ${book.runtimeType.toString()}");
    }
  }

  buyPhysicalBookByTitle(String title) {
    bool buyMore = true;
    double amount = 0;
    List purchasedBooks = [];
    while (buyMore) {
      if (searchByTitle(title).sell().runtimeType.toString() == 'double') {
        purchasedBooks.add(searchByTitle(title));
        amount = searchByTitle(title).price;
      }
      print('Do you want to buy another book? type yes or no');
      String User = (stdin.readLineSync().toString());
      if (User == 'yes' || User == 'Yes') {
        buyMore = true;
      } else {
        buyMore = false;
      }
    }
    print('you buy these books');
    print('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
    for (Book book in purchasedBooks) {
      print('${book.title}');
      print('amount: ${amount}');
    }
  }
}
